`include "../../lib/EECS151.v"
`include "full_adder.v"

module structural_adder #(
        parameter N = 3
    ) (
        input [N-1:0] a,
        input [N-1:0] b,
        output [N:0] sum
    );
    // TODO: Your code (from lab 2). You need to parameterize it
    wire c[N:0];

    assign c[0] = 0;
    assign sum[N] = c[N];


    genvar i;
    generate
        for(i = 0; i != N; i = i + 1) begin:gen_adder
            full_adder adder(a[i], b[i], c[i], sum[i], c[i+1]);
        end
    endgenerate
endmodule
