module structural_adder (
    input [2:0] a,
    input [2:0] b,
    output [3:0] sum
);
    // TODO: Insert your RTL here
    // Remove the assign statement once you write your own RTL

    wire c[3:0];

    assign c[0] = 0;
    assign sum[3] = c[3];


    genvar i;
    generate
        for(i = 0; i != 3; i = i + 1) begin:gen_adder
            full_adder(a[i], b[i], c[i], sum[i], c[i+1]);
        end
    endgenerate

endmodule
