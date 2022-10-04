`timescale 1ns / 1ps
module tb_sin();

    reg [8:0] sayi;
    wire [31:0] sonuc, sonuc1, sonuc2;
    wire sign;
    sin s(sayi, sonuc, sonuc1, sonuc2, sign);
    
    initial begin
        sayi = 0;#10;
        sayi = 15;#10;
        sayi = 30;#10;
        sayi = 45;#10;
        sayi = 60;#10;
        sayi = 75;#10;
        sayi = 90;#10;
        sayi = 105;#10;
        sayi = 120;#10;
        sayi = 135;#10;
        sayi = 150;#10;
        sayi = 165;#10;
        sayi = 180;#10;
        sayi = 195;#10;
        sayi = 210;#10;
        sayi = 225;#10;
        sayi = 240;#10;
        sayi = 255;#10;
        sayi = 270;#10;
        sayi = 285;#10;
        sayi = 300;#10;
        sayi = 315;#10;
        sayi = 330;#10;
        sayi = 345;#10;
        sayi = 360;#10;
    end

endmodule
