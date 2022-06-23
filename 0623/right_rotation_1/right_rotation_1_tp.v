`timescale 1ps/1ps
module right_rotation_1_tp;
    reg[7:0] din;
    wire [7:0] dout;
    
    parameter STEP = 1000;

    right_rotation_1 right_rotation_1(din, dout);
    
    initial begin
                din = 8'b10100001;
        #STEP   din = 8'b00000001;
        #STEP   din = 8'b01111111;
        #STEP   din = 8'b10000001;
        #STEP   $finish;
    end
    
    initial $monitor($stime, " din=%b dout=%b", din, dout);
endmodule