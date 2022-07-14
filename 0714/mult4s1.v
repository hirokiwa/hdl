module mult4s1(ck, res, start, done, a, b, p);
    input ck;       // クロック
    input res;      // リセット
    input start;    // startが1になると、計算を開始する
    output done;    // 計算が終了すると、doneを1にする
    input [3:0] a, b;
    output [7:0] p;

    reg done;
    reg [7:0] p;

    reg state;

    reg [7:0] a_reg;    // 被乗数を保持
    reg [3:0] b_reg;    // 乗数を保持
    reg [1:0] cnt;      // 繰り返し回数をカウント
    
    parameter   S0 = 1'b0,  // 初期状態
                S1 = 1'b1;  // 計算を行っている状態

    always @(posedge ck) begin
        if (res == 1'b1)
            state <= S0;
        else
            case (state)
                S0: begin
                    done <= 1'b0;
                    p <= 8'h00;
                    cnt <= 2'b00;
                    a_reg <= a;
                    b_reg <= b;
                    
                    if (start == 1)
                        state <= S1;
                    else
                        state <= S0;
                end
                S1: begin
                    p <= p + (a_reg & { 8{b_reg[0]} });

                    a_reg <= {a_reg[6:0], 1'b0};
                    b_reg <= {1'b0, b_reg[7:1]};

                    cnt <= cnt + 2'b01;
                    
                    if (cnt == 2'b11) begin
                        done <= 1'b1;
                        state <= S0;
                    end
                    else
                        state <= S1;
                end

                default:
                    state <= S0;
            endcase
    end

endmodule