`timescale 1ns/1ns
module full_adder(input wire a_n, b_n, cin_n,
                  output wire sum_n, carry_n);
    wire a = ~a_n;
    wire b = ~b_n;
    wire cin = ~cin_n;
    wire sum = a ^ b ^ cin;
    wire carry = (a & b) | (a & cin) | (b & cin);
    assign sum_n = ~sum;
    assign carry_n = ~carry;
endmodule
