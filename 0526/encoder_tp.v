`timescale 1ps/1ps
module encoder_tp;

reg  [7:0] din;
wire [2:0] dout;

parameter STEP = 1000;

encoder_casex	encoder_casex(din, dout);

initial begin
		din = 8'b0000_0001;
	#STEP	din = 8'b0000_0010;
	#STEP	din = 8'b0000_0100;
	#STEP	din = 8'b0000_1000;
	#STEP	din = 8'b0001_0000;
	#STEP	din = 8'b0010_0000;
	#STEP	din = 8'b0100_0000;
	#STEP	din = 8'b1000_0000;
	#STEP	din = 8'b1000_0001;
	#STEP	din = 8'b0000_0000;
	#STEP	$finish;
end

initial $monitor($stime, " din=%b: dout=%h", din, dout);

endmodule