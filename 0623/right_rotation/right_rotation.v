module right_rotation (din, s, dout);
    input [7:0] din;
    input [2:0] s;
    output [7:0] dout;

    always @(posedge s) begin
        assign dout = {din[0], din[7:1]};
    end
    
endmodule

// function,case使う？？？