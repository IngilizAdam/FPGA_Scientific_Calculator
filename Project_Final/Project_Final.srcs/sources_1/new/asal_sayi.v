`timescale 1ns / 1ps
module asal_sayi(
    input [8:0] sayi,
    output reg sonuc
    );
    
    reg [8:0] i;
    always @(sayi) begin // Girdi verilen sayi degeri degistikce yeni sonuc hesaplanir.
        if(sayi < 2'b10) begin // Bazi uc durumlar onceden belirlendi.
            sonuc = 1'b0;
        end
        else begin
            sonuc = 1'b1; // Asal oldugunu varsaydik.
            for(i=2'b10; i<sayi; i=i+1) begin // Sayinin kendisinden kucuk her sayiyla bolunme durumunu kontrol ettik.
                if(sayi%i == 1'b0) begin // Bolunuyorsa asal degildir.
                    sonuc = 1'b0;
                end
            end
        end
    end
    
endmodule
