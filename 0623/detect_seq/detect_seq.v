module detect_seq  (ck, rst, din, dout);
    input   ck;
    input   rst;
    input   din;
    output  dout;

    reg   [1:0]   cur;  // current state
    reg   [1:0]   nxt;  // next state

    parameter   S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

    // Next state function
    // Note that this is a combinational circuit

    always @(rst or din or cur) begin
        if (   rst  )
            nxt   <= S0;
        else
            case (din)
                1'b0 : nxt <= S2;
                1'b1 : nxt <= S1;
                default:
                    nxt <= S0;
            endcase
    end

    // State transition
    always @(posedge ck) begin
        cur <= nxt  ;
    end
    
    // Output function
    function dout_func;
        input   rst;
        input   din;
        input   [1:0] cur;
            if (   rst  )
                dout_func= 1'b0;
            else
                case (cur)
                    S0:    dout_func= 1'b0;
                    S1:    dout_func= (din == 1'b1) ? 1'b1 : 1'b0;
                    S2:    dout_func= (din == 1'b0) ? 1'b1 : 1'b0;
                    default:
                        dout_func= 1'bx;
                endcase
    endfunction

    assign dout = dout_func(rst, din, cur);

endmodule