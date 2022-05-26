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

fulladd add0 (.Q(q[0]), .COUT(cout[0]), .A(a[0]), .B(b[0]), .CIN(1'b0));
fulladd add1 (.Q(q[1]), .COUT(cout[1]), .A(a[1]), .B(b[1]), .CIN(cout[0]));
fulladd add2 (.Q(q[2]), .COUT(cout[2]), .A(a[2]), .B(b[2]), .CIN(cout[1]));
fulladd add3 (.Q(q[3]), .COUT(cout[3]), .A(a[3]), .B(b[3]), .CIN(cout[2]));

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