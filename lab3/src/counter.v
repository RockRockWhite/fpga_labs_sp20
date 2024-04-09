`include "../../lib/EECS151.v"

module counter #(
        parameter N = 4,
        parameter RATE_HZ = 1
    ) (
        input clk,
        input rst_counter,
        input [N-1:0] rst_counter_val,
        output [N-1:0] counter_output
    );

    // a reg to store the tick

    wire [31:0] tick_cnt;
    reg [31:0] tick_cnt_next;
    reg [N-1:0] second_cnt;

    REGISTER #(.N(32)) tick_reg(.q(tick_cnt), .d(tick_cnt_next), .clk(clk));

    always @(*) begin
        if(rst_counter) begin
            tick_cnt_next = 0;
            second_cnt = rst_counter_val;
        end
        else if(tick_cnt == RATE_HZ) begin
            // a new second
            tick_cnt_next = 0;
            second_cnt = second_cnt + 1;
        end
        else begin
            tick_cnt_next = tick_cnt + 1;
        end
    end

    assign counter_output = second_cnt;

endmodule
