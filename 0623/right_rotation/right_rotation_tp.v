`timescale 1ps/1ps
module right_rotation_tp;
    reg[7:0] din;
    reg[2:0] s;
    wire [7:0] dout;

    parameter STEP = 1000;

    right_rotation right_rotation(din, s, dout);

    initial begin
                din = 8'b10000001;  s = 3'h0;
        #STEP                       s = 3'h1;
        #STEP                       s = 3'h2;
        #STEP                       s = 3'h3;
        #STEP                       s = 3'h4;
        #STEP                       s = 3'h5;
        #STEP                       s = 3'h6;
        #STEP                       s = 3'h7;
        #STEP   din = 8'b11111110;  s = 3'h1;
        #STEP                       s = 3'h7;
        #STEP   $finish;
    end
    
    initial $monitor($stime, " din=%b s=%h dout=%b", din, s, dout);
endmodule