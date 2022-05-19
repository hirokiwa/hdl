module sel2to1_sndor(in0, in1, sel, dout);
input [1:0] in0, in1;
input sel;
output [1:0] dout;

function [1:0] select;
input [1:0] in0, in1;
input [1:0] sel;
    if(sel == 1'b1)
        select = in0;
    else
        select = in1;
    
endfunction

assign dout = select(in0, in1, sel);

endmodule