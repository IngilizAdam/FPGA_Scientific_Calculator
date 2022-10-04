`timescale 1ns / 1ps
module tb_asal_sayi();

    reg [8:0] sayi;
    wire sonuc;
    asal_sayi a(sayi, sonuc);
    
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
        sayi=350;#10;
        sayi=351;#10;
        sayi=352;#10;
        sayi=353;#10;
        sayi=354;#10;
        sayi=355;#10;
        sayi=356;#10;
        sayi=357;#10;
        sayi=358;#10;
        sayi=359;#10;
        sayi=360;#10;
    end

endmodule
