module sel2to1_sndor(in0, in1, sel, dout);
input [1:0] in0, in1;
input sel;
output [1:0] dout;

assign dout = (sel == 1'b1)? in1 : in0;

endmodule