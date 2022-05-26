module fulladd(A, B, CIN, Q, COUT);
input A, B, CIN;
output Q, COUT;

assign Q = A ^ B ^ CIN;
assign COUT = (A & B) | (B & CIN) | (CIN & A);

endmodule

module adder(a, b, q);
input [3:0] a, b;
output [3:0] q;
wire [3:0] cout;

fulladd add0 (a[0], b[0], 1'b0, q[0], cout[0]);
fulladd add1 (a[1], b[1], cout[0], q[1], cout[1]);
fulladd add2 (a[2], b[2], cout[1], q[2], cout[2]);
fulladd add3 (a[3], b[3], cout[2], q[3], cout[3]);

endmodule

`timescale 1ps/1ps

module adder_tp;
reg [3:0] a,b;
wire [3:0] q;

parameter STEP = 100000;

adder adder(a,b,q);

initial begin
        a = 4'h0;   b = 4'h0;
    #STEP   a = 4'h5;   b = 4'ha;
    #STEP   a = 4'h7;   b = 4'ha;
    #STEP   a = 4'h1;   b = 4'hf;
    #STEP   a = 4'hf;   b = 4'hf;
    #STEP   $finish;
end

initial $monitor($stime, " a=%h b=%h q=%h", a, b, q);
endmodule