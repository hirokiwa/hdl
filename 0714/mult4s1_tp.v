`timescale 1ps/1ps

module mult4s_tp;
reg        ck, res, start;
wire       done;
reg  [3:0] a, b;
wire [7:0] p;

parameter STEP = 100000;

mult4s1 mult4s1(ck, res, start, done, a, b, p);

always begin
        ck = 1; #(STEP/2);
        ck = 0; #(STEP/2);
end

initial begin
		start = 0;	res = 1;
	#STEP	res = 0;
	#STEP	start = 1;	a = 4'h0;	b = 4'h0;
	#STEP	start = 0;
	#(STEP*10)
	#STEP	start = 1;	a = 4'hf;	b = 4'h1;
	#STEP	start = 0;
	#(STEP*10)
	#STEP	start = 1;	a = 4'hf;	b = 4'h8;
	#STEP	start = 0;
	#(STEP*10)
	#STEP	start = 1;	a = 4'hf;	b = 4'hf;
	#STEP	start = 0;
	#(STEP*10)
	#STEP	start = 1;	a = 4'h1;	b = 4'ha;
	#STEP	start = 0;
	#(STEP*10)
	#STEP	start = 1;	a = 4'h8;	b = 4'ha;
	#STEP	start = 0;
	#(STEP*10)
	#STEP	start = 1;	a = 4'hf;	b = 4'ha;
	#STEP	start = 0;
	#(STEP*10)
		$finish;
end

initial $monitor($stime, " res=%b start=%b done=%b a=%d(%b) b=%d(%b) p=%d(%b)",
		 res, start, done, a, a, b, b, p, p);
endmodule