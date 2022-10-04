`timescale 1ns / 1ps
module ekran(
    input clk,
    input [3:0] sayi0, // 0. basamak
    input [3:0] sayi1, // 1. basamak
    input [3:0] sayi2, // 2. basamak
    input [3:0] sayi3, // 3. basamak
    input nokta, // Nokta olup olmayacaginin bilgisi

    output reg [3:0] an,
    output reg [6:0] seg,
    output reg dp = 1
    );

    reg [3:0] segSayi; // Basamaga yazilacak olan sayi

    reg [14:0] sayac = 0;
    reg [1:0] durum;
    always @(posedge clk) begin
        sayac = sayac + 1;
        
        // Her (2 uzeri 16)-1 clock dongusunde bir sonraki basamaga uygun sayiyi yazip,
        // obur basamaklari kapatiyoruz.
        // Bu islem cok hizli gerceklestigi icin, ekranda sabit goruntu gibi gozukuyor.
        
        if(durum == 0) begin
            an = 4'b1110;
            segSayi = sayi0;
            dp = 1;
            if(sayac == 15'b111111111111111) begin
                durum = 1;
                sayac = 0;
            end
        end
        else if(durum == 1) begin
            an = 4'b1101;
            segSayi = sayi1;
            dp = 1;
            if(sayac == 15'b111111111111111) begin
                durum = 2;
                sayac = 0;
            end
        end
        else if(durum == 2) begin
            an = 4'b1011;
            segSayi = sayi2;
            dp = ~nokta;
            if(sayac == 15'b111111111111111) begin
                durum = 3;
                sayac = 0;
            end
        end
        else if(durum == 3) begin
            an = 4'b0111;
            segSayi = sayi3;
            dp = 1;
            if(sayac == 15'b111111111111111) begin
                durum = 0;
                sayac = 0;
            end
        end
    end

    always @(segSayi) begin // Basamaga yazilacak olan sayi degistigi zaman seg cikisina uygun bitleri gonderen blok
        case(segSayi)
            4'b0000: seg = 7'b1000000; // "0"     
            4'b0001: seg = 7'b1111001; // "1" 
            4'b0010: seg = 7'b0100100; // "2" 
            4'b0011: seg = 7'b0110000; // "3" 
            4'b0100: seg = 7'b0011001; // "4" 
            4'b0101: seg = 7'b0010010; // "5" 
            4'b0110: seg = 7'b0000010; // "6" 
            4'b0111: seg = 7'b1111000; // "7" 
            4'b1000: seg = 7'b0000000; // "8"     
            4'b1001: seg = 7'b0010000; // "9" 
            4'b1010: seg = 7'b0111111; // "-" 
        endcase
    end

endmodule
