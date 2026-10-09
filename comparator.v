`timescale 1ns/1ns
module comparator(input wire a_n, b_n,
                  output wire lt_n, eq_n, gt_n);
    wire a = ~a_n;
    wire b = ~b_n;
    wire lt = (~a) & b;
    wire eq = ~(a ^ b);
    wire gt = a & (~b);
    assign lt_n = ~lt;
    assign eq_n = ~eq;
    assign gt_n = ~gt;
endmodule
