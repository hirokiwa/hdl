module encoder_casex(din, dout);
input   [7:0]   din;
output  [2:0]   dout;

function [2:0] enc;
input   [7:0]   din;
    casex (din)
        8'b1xxx_xxxx:   enc = 3'h7;
        8'b01xx_xxxx:   enc = 3'h6;
        8'b001x_xxxx:   enc = 3'h5;
        8'b0001_xxxx:   enc = 3'h4;
        8'b0000_1xxx:   enc = 3'h3;
        8'b0000_01xx:   enc = 3'h2;
        8'b0000_001x:   enc = 3'h1;
        8'b0000_0001:   enc = 3'h0;
        default:        enc = 3'hx;
    endcase
endfunction

assign dout = enc(din);

endmodule