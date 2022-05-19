module sel2to1_sndor(in0, in1, sel, dout);
input [1:0] in0, in1;
input sel;
output [1:0] dout;

function [1:0] select;
input [1:0] in0, in1;
input [1:0] sel;
    case(sel)
        1'b0:   select = in0;
        1'b1:   select = in1;
        default: select = 1'bx;
    endcase    
endfunction

assign dout = select(in0, in1, sel);

endmodule