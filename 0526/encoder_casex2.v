module encoder_casex2(din, dout);
input   [7:0]   din;
output  [2:0]   dout;

function [2:0] enc;
input   [7:0]   din;
    casex (din)
        8'bxxxx_xxx1:   enc = 3'h0;
        8'bxxxx_xx10:   enc = 3'h1;
        8'bxxxx_x100:   enc = 3'h2;
        8'bxxxx_1000:   enc = 3'h3;
        8'bxxx1_0000:   enc = 3'h4;
        8'bxx10_0000:   enc = 3'h5;
        8'bx100_0000:   enc = 3'h6;
        8'b1000_0000:   enc = 3'h7;
        default:        enc = 3'hx;
    endcase
endfunction

assign dout = enc(din);

endmodule