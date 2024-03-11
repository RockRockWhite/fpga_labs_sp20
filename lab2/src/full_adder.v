module full_adder (
    input a,
    input b,
    input carry_in,
    output sum,
    output carry_out
);
    // TODO: Insert your RTL here to calculate the sum and carry out bits
    // Remove these assign statements once you write your own RTL
     wire a_and_b, a_and_c, b_and_c;
     and(a_and_b, a, b);
     and(a_and_c, a, carry_in);
     and(b_and_c, b, carry_in);

     wire carry_out_temp;
     or(carry_out_temp, a_and_b, a_and_c);
     or(carry_out, carry_out_temp, b_and_c);

     wire sum_temp;
     xor(sum_temp, a, b);
     xor(sum, sum_temp, carry_in);
endmodule
