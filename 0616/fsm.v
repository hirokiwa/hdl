module fsm  (ck, rst, din, dout);
    input   ck;     // clock
    input   rst;    // reset
    input   din;    // data-in
    output  dout;   // data-out

    reg   [1:0]   cur;  // current state
    reg   [1:0]   nxt;  // next state

    parameter   S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

    // Next state function
    // Note that this is a combinational circuit

    always @(rst or din or cur) begin
        if (   rst  )
            nxt   <= S0;
        else
            case (cur)
                S0 : nxt <= (din == 1'b1) ? S1 : S0;
                S1 : nxt <= (din == 1'b1) ? S2 : S0;
                S2 : nxt <= (din == 1'b1) ? S2 : S0;
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
                    S1:    dout_func= 1'b0;
                    S2:    dout_func= (din == 1'b1) ? 1'b1 : 1'b0;
                    default:
                        dout_func= 1'bx;
                endcase
    endfunction

    assign dout = dout_func(rst, din, cur);

endmodule