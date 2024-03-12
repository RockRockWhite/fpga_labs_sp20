`timescale 1ns / 1ps
`include "../../lib/EECS151.v"

module z1top_counter_alinx (
    input CLK_125MHZ_FPGA,
    input [3:0] BUTTONS,
    output [3:0] LEDS
);
    // Some initial code has been provided for you
    wire [3:0] led_counter_val;
    wire [3:0] led_counter_update;
    wire is_one_sec;

    // This register will be updated when is_one_sec is True
    REGISTER_CE #(4) led_counter_reg (.clk(CLK_125MHZ_FPGA), .ce(is_one_sec), .d(led_counter_update), .q(led_counter_val));

    assign LEDS[3:0] = ~led_counter_val;
    assign led_counter_update = led_counter_val + 1;

    // is_one_sec is True every second (= how many cycles?)
    // You may use another register of keep track of the time
    // TODO: Correct the following assignment when you write your code
    // this is a counter for count the clk
    wire [63:0] clk_counter_val;
    wire [63:0] clk_counter_update;

    REGISTER_R #(64) clk_counter_reg (.clk(CLK_125MHZ_FPGA), .rst(is_one_sec), .d(clk_counter_update), .q(clk_counter_val));
    assign clk_counter_update = clk_counter_val + 1;


    assign is_one_sec = (clk_counter_val == 50 * 1000 * 1000) ? 1'b1 : 1'b0;

    // TODO: Instantiate a REIGISTER module for your second register/counter
    // You also need to think of how many bits are required for your register

endmodule
