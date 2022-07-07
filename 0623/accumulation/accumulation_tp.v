`timescale 1ps/1ps

module accumulation_tp;
    reg clk, rst;
    reg[3:0]din;
    wire[7:0]dout;
    
    parameter STEP = 1000;
    
    accumulation accumulation(clk ,  rst , din, dout);
    
    always begin
        clk= 1; #(STEP/2);
        clk= 0; #(STEP/2);
    end
    
    initial begin
                    rst= 0; din = 0;
        #STEP       rst= 1;
        #STEP       rst= 0; din = 4'b0001;
        #STEP               din = 4'b0010;
        #STEP               din = 4'b0100;
        #STEP               din = 4'b1000;
        #STEP               din = 4'b0001;
        #(STEP*4)   rst= 1;
        #STEP       $finish;
    end
    
    initial $monitor($stime, "  clk  =%b rst  =%b din=%b dout=%b", clk , rst , din, dout);
endmodule