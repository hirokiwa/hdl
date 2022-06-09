`timescale 1ps/1ps

module shift_reg_tp;
    reg ck, res, si;
    wire [3:0] q;
    parameter STEP = 1000;
    
    shift_reg shift_reg(ck, res, si, q);
    
    always begin
        ck = 1; #(STEP/2);
        ck = 0; #(STEP/2);
    end
    
    initial begin
                res = 0;
        #STEP   res = 1;
        #STEP   res = 0;    si = 1;
        #STEP               si = 0;
        #STEP               si = 1;
        #STEP               si = 1;
        #STEP               si = 0;
        #(STEP*4)
        $finish;
    end
    
    initial $monitor($stime, " ck=%b res=%b si=%b q=%b",ck, res, si, q);
endmodule