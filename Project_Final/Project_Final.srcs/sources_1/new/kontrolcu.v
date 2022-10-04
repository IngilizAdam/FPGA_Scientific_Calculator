`timescale 1ns / 1ps
module kontrolcu(
    input clk,
    input RsRx, // UART Alici pin
    output RsTx, // UART Verici pin
    output [3:0] an, // Ekrandaki kullanilacak basamak
    output [6:0] seg, // Ekrana yazilacak olan sayi
    output dp // Nokta olup olmayacagi
    );

    wire [8:0] sayi;
    wire [1:0] islem;
    
    reg [3:0] sayi0, sayi1, sayi2, sayi3; // Ekrana giden sayilar
    reg nokta = 0; // Ekrana giden nokta bilgisi

    uart uart(clk, RsRx, RsTx, sayi, islem); // UART modulu olusturuldu

    ekran ekran(clk, sayi0, sayi1, sayi2, sayi3, nokta, an, seg, dp); // Ekran modulu olusturuldu
    
    wire [31:0] kkSonuc, kkSonuc1, kkSonuc2; // Karekok modulunden gelecek olan sonuclar
    karekok karekok(sayi, kkSonuc, kkSonuc1, kkSonuc2); // Karekok modulu olusturuldu

    wire [3:0] sinSonuc, sinSonuc1, sinSonuc2; // Sinus modulunden gelecek olan sonuclar
    wire sinIsaret; // Sinus modulunden gelecek olan isaret bilgisi
    sin sin(sayi, sinSonuc, sinSonuc1, sinSonuc2, sinIsaret); // Sinus modulu olusturuldu
    
    wire [3:0] cosSonuc, cosSonuc1, cosSonuc2; // Cosinus modulunden gelecek olan sonuclar
    wire cosIsaret; // Cosinus modulunden gelecek olan isaret bilgisi
    cos cos(sayi, cosSonuc, cosSonuc1, cosSonuc2, cosIsaret); // Cosinus modulu olusturuldu

    wire asalSonuc; // Asal_sayi modulunden gelecek olan sonuc
    asal_sayi asal_sayi(sayi, asalSonuc); // Asal_sayi modulu olusturuldu

    always @(posedge clk) begin
        if(islem == 0) begin // Karekok islemi
            sayi0 = kkSonuc2; // Virgulden sonraki ikinci basamagi, Ekrandaki 0. basamaga yazdik
            sayi1 = kkSonuc1; // Virgulden sonraki birinci basamagi, Ekrandaki 1. basamaga yazdik
            sayi2 = kkSonuc%10; // Birler basamagini ekrandaki 2. basamaga yazdik
            sayi3 = kkSonuc/10; // Onlar basamagini ekrandaki 3. basamaga yazdik
            nokta = 1; // Karekok islemi oldugu icin nokta olacak
        end
        else if(islem == 1) begin // Sinus islemi
            sayi0 = sinSonuc2; // Virgulden sonraki ikinci basamagi, ekrandaki 0. basamaga yazdik
            sayi1 = sinSonuc1; // Virgulden sonraki birinci basamagi, ekrandaki 1. basamaga yazdik
            sayi2 = sinSonuc; // Birler basamagini ekrandaki 2. basamaga yazdik
            sayi3 = sinIsaret*10; // Sinus islemi sonucunda isaret "-" geldiyse ekrandaki 3. basamaga "-" yazdik
            nokta = 1; // Sinus islemi oldugu icin nokta olacak
        end
        else if(islem == 2) begin // Cosinus islemi
            sayi0 = cosSonuc2; // Virgulden sonraki ikinci basamagi, ekrandaki 0. basamaga yazdik
            sayi1 = cosSonuc1; // Virgulden sonraki birinci basamagi, ekrandaki 1. basamaga yazdik
            sayi2 = cosSonuc; // Birler basamagini ekrandaki 2. basamaga yazdik
            sayi3 = cosIsaret*10; // Cosinus islemi sonucunda isaret "-" geldiyse ekrandaki 3. basamaga "-" yazdik
            nokta = 1; // Cosinus islemi oldugu icin nokta olacak
        end
        else if(islem == 3) begin // Asal_Sayi islemi
            sayi0 = asalSonuc; // Sonucu ekrandaki 0. basamaga yazdik
            sayi1 = 0; // Asal_Sayi isleminde bu basamak kullanilmaz
            sayi2 = 0; // Asal_Sayi isleminde bu basamak kullanilmaz
            sayi3 = 0; // Asal_Sayi isleminde bu basamak kullanilmaz
            nokta = 0; // Asal_Sayi islemi oldugu icin nokta olmayacak
        end
    end

endmodule
