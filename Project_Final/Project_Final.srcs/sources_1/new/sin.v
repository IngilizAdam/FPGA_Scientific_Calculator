`timescale 1ns / 1ps
module sin(
    input [8:0] sayi,
    output reg [31:0] sonuc, sonuc1, sonuc2,
    output reg isaret
    );
    
    reg [6:0] yeniSayi;
    always @(sayi) begin // Girdi verilen sayi degeri degistikce yeni sonuc hesaplanir.
        if(sayi < 90 && sayi >= 0) begin // Aci degeri 1. Bolgedeyse
            yeniSayi = sayi;
            isaret = 0; // Pozitif
        end
        else if(sayi < 180 && sayi >= 90) begin // Aci degeri 2. Bolgedeyse
            yeniSayi = 180-sayi;
            isaret = 0; // Pozitif
        end
        else if(sayi < 270 && sayi >= 180) begin // Aci degeri 3. Bolgedeyse
            yeniSayi = sayi-180;
            isaret = 1; // Negatif
        end
        else begin // Aci degeri 4. Bolgedeyse
            yeniSayi = 360-sayi;
            isaret = 1; // Negatif
        end
        
        if(yeniSayi == 0) begin
            sonuc = 0;
            sonuc1 = 0;
            sonuc2 = 0;
        end
        else if(yeniSayi == 1) begin
            sonuc = 0;
            sonuc1 = 0;
            sonuc2 = 1;
        end
        else if(yeniSayi == 2) begin
            sonuc = 0;
            sonuc1 = 0;
            sonuc2 = 3;
        end
        else if(yeniSayi == 3) begin
            sonuc = 0;
            sonuc1 = 0;
            sonuc2 = 5;
        end
        else if(yeniSayi == 4) begin
            sonuc = 0;
            sonuc1 = 0;
            sonuc2 = 6;
        end
        else if(yeniSayi == 5) begin
            sonuc = 0;
            sonuc1 = 0;
            sonuc2 = 8;
        end
        else if(yeniSayi == 6) begin
            sonuc = 0;
            sonuc1 = 1;
            sonuc2 = 0;
        end
        else if(yeniSayi == 7) begin
            sonuc = 0;
            sonuc1 = 1;
            sonuc2 = 2;
        end
        else if(yeniSayi == 8) begin
            sonuc = 0;
            sonuc1 = 1;
            sonuc2 = 3;
        end
        else if(yeniSayi == 9) begin
            sonuc = 0;
            sonuc1 = 1;
            sonuc2 = 5;
        end
        else if(yeniSayi == 10) begin
            sonuc = 0;
            sonuc1 = 1;
            sonuc2 = 7;
        end
        else if(yeniSayi == 11) begin
            sonuc = 0;
            sonuc1 = 1;
            sonuc2 = 9;
        end
        else if(yeniSayi == 12) begin
            sonuc = 0;
            sonuc1 = 2;
            sonuc2 = 0;
        end
        else if(yeniSayi == 13) begin
            sonuc = 0;
            sonuc1 = 2;
            sonuc2 = 2;
        end
        else if(yeniSayi == 14) begin
            sonuc = 0;
            sonuc1 = 2;
            sonuc2 = 4;
        end
        else if(yeniSayi == 15) begin
            sonuc = 0;
            sonuc1 = 2;
            sonuc2 = 5;
        end
        else if(yeniSayi == 16) begin
            sonuc = 0;
            sonuc1 = 2;
            sonuc2 = 7;
        end
        else if(yeniSayi == 17) begin
            sonuc = 0;
            sonuc1 = 2;
            sonuc2 = 9;
        end
        else if(yeniSayi == 18) begin
            sonuc = 0;
            sonuc1 = 3;
            sonuc2 = 0;
        end
        else if(yeniSayi == 19) begin
            sonuc = 0;
            sonuc1 = 3;
            sonuc2 = 2;
        end
        else if(yeniSayi == 20) begin
            sonuc = 0;
            sonuc1 = 3;
            sonuc2 = 4;
        end
        else if(yeniSayi == 21) begin
            sonuc = 0;
            sonuc1 = 3;
            sonuc2 = 5;
        end
        else if(yeniSayi == 22) begin
            sonuc = 0;
            sonuc1 = 3;
            sonuc2 = 7;
        end
        else if(yeniSayi == 23) begin
            sonuc = 0;
            sonuc1 = 3;
            sonuc2 = 9;
        end
        else if(yeniSayi == 24) begin
            sonuc = 0;
            sonuc1 = 4;
            sonuc2 = 0;
        end
        else if(yeniSayi == 25) begin
            sonuc = 0;
            sonuc1 = 4;
            sonuc2 = 2;
        end
        else if(yeniSayi == 26) begin
            sonuc = 0;
            sonuc1 = 4;
            sonuc2 = 3;
        end
        else if(yeniSayi == 27) begin
            sonuc = 0;
            sonuc1 = 4;
            sonuc2 = 5;
        end
        else if(yeniSayi == 28) begin
            sonuc = 0;
            sonuc1 = 4;
            sonuc2 = 6;
        end
        else if(yeniSayi == 29) begin
            sonuc = 0;
            sonuc1 = 4;
            sonuc2 = 8;
        end
        else if(yeniSayi == 30) begin
            sonuc = 0;
            sonuc1 = 5;
            sonuc2 = 0;
        end
        else if(yeniSayi == 31) begin
            sonuc = 0;
            sonuc1 = 5;
            sonuc2 = 1;
        end
        else if(yeniSayi == 32) begin
            sonuc = 0;
            sonuc1 = 5;
            sonuc2 = 2;
        end
        else if(yeniSayi == 33) begin
            sonuc = 0;
            sonuc1 = 5;
            sonuc2 = 4;
        end
        else if(yeniSayi == 34) begin
            sonuc = 0;
            sonuc1 = 5;
            sonuc2 = 5;
        end
        else if(yeniSayi == 35) begin
            sonuc = 0;
            sonuc1 = 5;
            sonuc2 = 7;
        end
        else if(yeniSayi == 36) begin
            sonuc = 0;
            sonuc1 = 5;
            sonuc2 = 8;
        end
        else if(yeniSayi == 37) begin
            sonuc = 0;
            sonuc1 = 6;
            sonuc2 = 0;
        end
        else if(yeniSayi == 38) begin
            sonuc = 0;
            sonuc1 = 6;
            sonuc2 = 1;
        end
        else if(yeniSayi == 39) begin
            sonuc = 0;
            sonuc1 = 6;
            sonuc2 = 2;
        end
        else if(yeniSayi == 40) begin
            sonuc = 0;
            sonuc1 = 6;
            sonuc2 = 4;
        end
        else if(yeniSayi == 41) begin
            sonuc = 0;
            sonuc1 = 6;
            sonuc2 = 5;
        end
        else if(yeniSayi == 42) begin
            sonuc = 0;
            sonuc1 = 6;
            sonuc2 = 6;
        end
        else if(yeniSayi == 43) begin
            sonuc = 0;
            sonuc1 = 6;
            sonuc2 = 8;
        end
        else if(yeniSayi == 44) begin
            sonuc = 0;
            sonuc1 = 6;
            sonuc2 = 9;
        end
        else if(yeniSayi == 45) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 0;
        end
        else if(yeniSayi == 46) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 1;
        end
        else if(yeniSayi == 47) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 3;
        end
        else if(yeniSayi == 48) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 4;
        end
        else if(yeniSayi == 49) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 5;
        end
        else if(yeniSayi == 50) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 6;
        end
        else if(yeniSayi == 51) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 7;
        end
        else if(yeniSayi == 52) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 8;
        end
        else if(yeniSayi == 53) begin
            sonuc = 0;
            sonuc1 = 7;
            sonuc2 = 9;
        end
        else if(yeniSayi == 54) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 0;
        end
        else if(yeniSayi == 55) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 1;
        end
        else if(yeniSayi == 56) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 2;
        end
        else if(yeniSayi == 57) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 3;
        end
        else if(yeniSayi == 58) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 4;
        end
        else if(yeniSayi == 59) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 5;
        end
        else if(yeniSayi == 60) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 6;
        end
        else if(yeniSayi == 61) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 7;
        end
        else if(yeniSayi == 62) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 8;
        end
        else if(yeniSayi == 63) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 9;
        end
        else if(yeniSayi == 64) begin
            sonuc = 0;
            sonuc1 = 8;
            sonuc2 = 9;
        end
        else if(yeniSayi == 65) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 0;
        end
        else if(yeniSayi == 66) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 1;
        end
        else if(yeniSayi == 67) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 2;
        end
        else if(yeniSayi == 68) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 2;
        end
        else if(yeniSayi == 69) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 3;
        end
        else if(yeniSayi == 70) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 3;
        end
        else if(yeniSayi == 71) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 4;
        end
        else if(yeniSayi == 72) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 5;
        end
        else if(yeniSayi == 73) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 5;
        end
        else if(yeniSayi == 74) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 6;
        end
        else if(yeniSayi == 75) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 6;
        end
        else if(yeniSayi == 76) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 7;
        end
        else if(yeniSayi == 77) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 7;
        end
        else if(yeniSayi == 78) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 7;
        end
        else if(yeniSayi == 79) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 8;
        end
        else if(yeniSayi == 80) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 8;
        end
        else if(yeniSayi == 81) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 8;
        end
        else if(yeniSayi == 82) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 9;
        end
        else if(yeniSayi == 83) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 9;
        end
        else if(yeniSayi == 84) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 9;
        end
        else if(yeniSayi == 85) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 9;
        end
        else if(yeniSayi == 86) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 9;
        end
        else if(yeniSayi == 87) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 9;
        end
        else if(yeniSayi == 88) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 9;
        end
        else if(yeniSayi == 89) begin
            sonuc = 0;
            sonuc1 = 9;
            sonuc2 = 9;
        end
        else if(yeniSayi == 90) begin
            sonuc = 1;
            sonuc1 = 0;
            sonuc2 = 0;
        end
    end
    
endmodule
