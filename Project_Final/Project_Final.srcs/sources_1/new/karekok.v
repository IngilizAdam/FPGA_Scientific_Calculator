`timescale 1ns / 1ps
module karekok(
    input [8:0] sayi,
    output reg [31:0] sonuc, sonuc1, sonuc2
    );
    
    reg [31:0] i, yeniSayi;
    always @(sayi) begin // Girdi verilen sayi degeri degistikce yeni sonuc hesaplanir.
        if(sayi == 0) begin // Bazi uc durumlar onceden belirlendi.
            sonuc = 0;
            sonuc1 = 0;
            sonuc2 = 0;
        end
        else if(sayi == 1) begin
            sonuc = 1;
            sonuc1 = 0;
            sonuc2 = 0;
        end
        else if(sayi == 2) begin
            sonuc = 1;
            sonuc1 = 4;
            sonuc2 = 1;
        end
        else begin
            yeniSayi = sayi*10000; // Virgulden sonraki 2 basamagi kurtarmak icin karekoku sorulan sayinin 10000 kati alinir.
            i = 100; // Sonuc icin yaklasik bir deger tahmin edilir.

            // Karekok yaklasik deger algoritmasi soyle calisir:
            // X sayisinin karekoku soruluyorsa rastgele bir tahmin yapilir,
            // Bu tahmine X/tahmin sayisi eklenir ve sonuc 2'ye bolunur.
            // Elde edilen sonuc istenilen karekoke yaklasmis olur.
            // Birkac kere tekrar ederek en dogru sonuc elde edilmeye calisilinir.

            i = (i + (yeniSayi/i))/2; // Karekok yaklasik deger algoritmasi uygulanir.
            i = (i + (yeniSayi/i))/2;
            i = (i + (yeniSayi/i))/2;
            i = (i + (yeniSayi/i))/2;
            i = (i + (yeniSayi/i))/2;
            i = (i + (yeniSayi/i))/2;
            i = (i + (yeniSayi/i))/2;
            i = (i + (yeniSayi/i))/2;

            sonuc = i/100; // Bulunan karekok degerinin 100'e bolumu, tam kismi verir.
            sonuc1 = (i/10)%10; // Virgulden sonraki ilk basamak boyle elde edilir.
            sonuc2 = i%10; // Virgulden sonraki ikinci basamak boyle elde edilir.
        end
    end
    
endmodule
