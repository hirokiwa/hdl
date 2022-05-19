module sel2to1_sndor(in0, in1, sel, dout);
input [1:0] in0, in1;
input sel;
output [1:0] dout;

assign dout[0] = (~sel & in0[0]) | (sel & in1[0]);
assign dout[0] = (~sel & in0[1]) | (sel & in1[1]);

endmodule