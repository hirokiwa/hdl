module shift_reg (ck, res, si, q);
    input ck, res, si;
    output [3:0] q;
    reg [3:0] q;

    always @(posedge ck) begin
        if(res)
            q <= 4'h0;
        else begin
            q[0]    = si;
            q[3:1]  = q[2:0];
        end
    end
    
endmodule