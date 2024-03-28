`include "../../lib/EECS151.v"
`include "full_adder.v"

module structural_adder #(
        parameter N = 3
    ) (
        input clk,
        input [N-1:0] a,
        input [N-1:0] b,
        output [N:0] sum
    );
    // TODO: Your code (from lab 2). You need to parameterize it
    wire [N:0] c;
    wire [N:0] adder_sum;

    assign c[0] = 0;
    assign adder_sum[N] = c[N];


    genvar i;
    generate
        for(i = 0; i != N; i = i + 1) begin:gen_adder
            full_adder adder(a[i], b[i], c[i], adder_sum[i], c[i+1]);
        end
    endgenerate

    // add a reg to update the sum only when the clk ticks
    REGISTER #(.N(N+1)) sum_reg(.q(sum), .d(adder_sum), .clk(clk));


endmodule
