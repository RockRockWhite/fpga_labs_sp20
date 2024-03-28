`include "../src/structural_adder.v"
`timescale 1ns/1ns

module structural_adder_tb();
    parameter N = 32;

    reg clock;
    initial
        clock = 0;
    always #(4) clock <= ~clock;

    reg  [N-1:0] operand1, operand2;
    wire [N:0] adder_output;

    structural_adder #(32) dut (
                         .clk(clock),
                         .a(operand1),
                         .b(operand2),
                         .sum(adder_output)
                     );

    wire [N-1:0] operand1s [8:0];
    wire [N-1:0] operand2s [8:0];

    assign operand1s[0] = 32'd1000;
    assign operand2s[0] = 32'd1000;

    assign operand1s[1] = 32'd2000;
    assign operand2s[1] = 32'd2000;

    assign operand1s[2] = 32'd3000;
    assign operand2s[2] = 32'd3000;

    assign operand1s[3] = 32'd4000;
    assign operand2s[3] = 32'd4000;

    assign operand1s[4] = 32'd5000;
    assign operand2s[4] = 32'd5000;

    assign operand1s[5] = 32'd6000;
    assign operand2s[5] = 32'd6000;

    assign operand1s[6] = 32'd7000;
    assign operand2s[6] = 32'd7000;

    assign operand1s[7] = 32'd8000;
    assign operand2s[7] = 32'd8000;

    integer test_index = 0;
    always #(100) begin
        operand1 = operand1s[test_index];
        operand2 = operand2s[test_index];
        test_index = test_index + 1;
    end

    initial begin
        $dumpfile("structural_adder_tb.vcd");
        $dumpvars(0, structural_adder_tb);
        // #0;
        // operand1 = 32'd1000;
        // operand2 = 32'd1000;
        // #100;
        // operand1 = 32'd2000;
        // #300;
        // operand2 = 32'd3000;
        #1000;

        $finish();
    end

endmodule
