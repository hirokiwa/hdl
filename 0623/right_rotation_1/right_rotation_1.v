module right_rotation_1 (din, dout);
    input [7:0] din;
    output [7:0] dout;

    assign dout = {din[0], din[7:1]};
    
endmodule