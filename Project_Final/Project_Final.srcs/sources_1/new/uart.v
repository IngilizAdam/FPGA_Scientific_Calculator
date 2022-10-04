`timescale 1ns / 1ps
module uart(
    input clk,
    input RsRx, // Alici pin
    output reg RsTx = 1, // Verici pin (llk degeri 1 yapildi cunku FPGA basladigi zaman veri gondermemesi gerekiyor)

    output reg [8:0] sayi, // Okunan deger
    output reg [1:0] islem // A:00:karekok, S:01:sin, D:10:cos, F:11:asal
    );

    reg [1:0] durum;

    reg [3:0] bitSayisi;
    reg [7:0] okunanVeri = 8'b00000000;
    reg yenidenOkuma = 1;

    reg [13:0] sayac = 0;
    always @(posedge clk) begin
        sayac = sayac+1;
        if(sayac >= 10415) begin // 100MHz/9600
            sayac = 0;

            // Baud rate: 9600 (Saniyede gonderilen-alinan bit sayisi)
            // Burada her saniyede 9600 bit alip yorumlayan bir durum makinesi yazdik
            if(durum == 0) begin // RsRx yani alici pin mantik-0 olana kadar bu durumda bekle
                if(RsRx == 0) begin
                    durum = 1; // RsRx yani alici pin mantik-0 olursa durum 1'e gec
                    RsTx = 0; // Veri okurken okudugumuz veriyi veri gondermek icin RsTx'i (verici pin) 0 yapiyorum (start bit)
                end
            end
            else if(durum == 1) begin
                RsTx = RsRx; // Okunan veriyi ayni sekilde geri ver

                okunanVeri[bitSayisi] = RsRx; // Okunan veriyi okunanVeri'de depoladik
                bitSayisi = bitSayisi + 1;

                if(bitSayisi == 8) begin // 8 bit okundugu zaman durum 2'ye gec
                    bitSayisi = 0;
                    durum = 2;
                end
            end
            else if(durum == 2) begin
                RsTx = 1; // Okuma islemi tamamlandigi zaman verici pin'i 1 yapiyorum (stop bit)

                if(okunanVeri > 47 && okunanVeri < 58) begin // Okunan veri bir sayi ise sayi'nin uygun basamagina ekledik
                    if(yenidenOkuma) begin // Yeni sayi okunuyorsa eski degeri sifirliyoruz
                        sayi = 0;
                        yenidenOkuma = 0;
                    end
                    sayi = (sayi*10) + (okunanVeri-48);
                end

                if(okunanVeri == 10) // Okunan veri \n yani "yeni satir" ise ENTER'a basilmis demektir
                    yenidenOkuma = 1; // yenidenOkuma degiskenini 1 yaparak sonraki okuma durumuna hazirlamis oluyoruz
                    
                if(okunanVeri == 82 || okunanVeri == 114) // Eger ENTER'a basmadan veri gonderilen bir platform kullaniliyorsa R-r harfi basildiginda sayiyi sifirladik
                    sayi = 0;

                if(okunanVeri == 65 || okunanVeri == 97) // A-a basildi (Karekok modu)
                    islem = 2'b00;
                else if(okunanVeri == 83 || okunanVeri == 115) // S-s basildi (Sinus modu)
                    islem = 2'b01;
                else if(okunanVeri == 68 || okunanVeri == 100) // D-d basildi (Cosinus modu)
                    islem = 2'b10;
                else if(okunanVeri == 70 || okunanVeri == 102) // F-f basildi (Asal sayi modu)
                    islem = 2'b11;

                durum = 0; // Okuma islemi tamamlandigi zaman yeni okuma islemi icin durum 0'a gec
            end
        end
    end

endmodule
