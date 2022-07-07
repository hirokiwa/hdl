module accumulation(clk, res, din, dout);
    input   clk, res;
    input   [3:0] din;
    output  [7:0] dout;

    reg     [7:0]   q;

    always @(posedge clk or posedge res) begin
        if(res == 1'b1)
            q <= 8'b0;
        else
            q <= q + din;
    end

    assign dout[7:0] = q[7:0];

endmodule
