module right_rotation (din, s, dout);
    input [7:0] din;
    input [2:0] s;
    output [7:0] dout;

    function [7:0] select;
        input [7:0] din;
        input [2:0] s;

            case(s)
                3'h0:   select = din;
                3'h1:   select = {din[0], din[7:1]};
                3'h2:   select = {din[1:0], din[7:2]};
                3'h3:   select = {din[2:0], din[7:3]};
                3'h4:   select = {din[3:0], din[7:4]};
                3'h5:   select = {din[4:0], din[7:5]};
                3'h6:   select = {din[5:0], din[7:6]};
                3'h7:   select = {din[6:0], din[7]};
                default: select = 8'bxxxxxxxx;
            endcase    
    endfunction

    assign dout = select(din, s);
    
endmodule
