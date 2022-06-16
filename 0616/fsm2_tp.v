`timescale 1ps/1ps
module fsm2_tp;
    reg ck, rst, din;
    wire dout;
    parameter STEP = 1000;

    fsm2 fsm2(ck, rst, din, dout);
    
    always begin
        ck = 1; #(STEP/2);
        ck = 0; #(STEP/2);
    end
    
    initial begin
        #(STEP/2)   rst = 1; din = 0;
        #(STEP/2)   rst = 0;
        #STEP       din = 1;
        #STEP       din = 1;
        #STEP       din = 0;
        #STEP       din = 1;
        #STEP       din = 1;
        #STEP       din = 1;
        #STEP       din = 1;
        #STEP       din = 0;
        #STEP       din = 0;
        $finish;
    end
    
    initial $monitor($stime, "ck=%b rst=%b  din=%b  dout=%b", ck, rst, din, dout);

endmodule