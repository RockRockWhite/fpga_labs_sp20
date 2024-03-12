`timescale 1ns / 1ps

module z1top_adder (
    input [1:0] A,
    input [1:0] B,
    output [3:0] C
);

    wire [2:0] adder_operand1, adder_operand2;
    wire [3:0] adder_result;

    assign adder_operand1 = {0, ~A[1:0]};
    assign adder_operand2 = {0, ~B[1:0]};
    assign C = ~adder_result;
  
    behavioral_adder user_adder(
        .a(adder_operand1),
        .b(adder_operand2),
        .sum(adder_result)
    );

endmodule
