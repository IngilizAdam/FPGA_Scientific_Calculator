`timescale 1ns / 1ps
module tb_karekok();
    
    reg [8:0] sayi;
    wire [31:0] sonuc, sonuc1, sonuc2;
    karekok k(sayi, sonuc, sonuc1, sonuc2);
    
    initial begin
        sayi=0;#10;
        sayi=1;#10;
        sayi=2;#10;
        sayi=3;#10;
        sayi=4;#10;
        sayi=5;#10;
        sayi=6;#10;
        sayi=7;#10;
        sayi=8;#10;
        sayi=9;#10;
        sayi=10;#10;
        sayi=11;#10;
        sayi=12;#10;
        sayi=13;#10;
        sayi=14;#10;
        sayi=15;#10;
        sayi=16;#10;
        sayi=17;#10;
        sayi=18;#10;
        sayi=19;#10;
        sayi=20;#10;
        sayi=280;#10;
    end

endmodule
