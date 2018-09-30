`timescale 1ns / 100ps
`include "mux_41.v"
`include "mux_41_tester.v"
`include "mux_41_estructural.v"

module mux_tb;
   wire reset_L, clk;
   wire [3:0] data_0;
   wire [3:0] data_1;
   wire [3:0] data_2;
   wire [3:0] data_3;
   wire [3:0] data_out_cond;
   wire [3:0] data_out_est;
   wire       valid_0;
   wire       valid_1;
   wire       valid_2;
   wire       valid_3;
   wire       valid_out_cond;
   wire       valid_out_est;

   mux_41 mux_41_( .reset_L (reset_L),
             .clk (clk),
             .data_0 (data_0),
             .data_1 (data_1),
             .data_2 (data_2),
             .data_3 (data_3),
             .data_out (data_out_cond),
             .valid_0 (valid_0),
             .valid_1 (valid_1),
             .valid_2 (valid_2),
             .valid_3 (valid_3),
             .valid_out (valid_out_cond)
             );

   mux_41_tester mux_41_tester_( .reset_L (reset_L),
                           .clk (clk),
                           .data_0 (data_0),
                           .data_1 (data_1),
                           .data_2 (data_2),
                           .data_3 (data_3),
                           .data_out_cond (data_out_cond),
                           .data_out_est (data_out_est),
                           .valid_0 (valid_0),
                           .valid_1 (valid_1),
                           .valid_2 (valid_2),
                           .valid_3 (valid_3),
                           .valid_out_cond (valid_out_cond),
                           .valid_out_est (valid_out_est)
                           );

   mux_41_estructural mux_41_est_( .reset_L (reset_L),
                             .clk (clk),
                             .data_0 (data_0),
                             .data_1 (data_1),
                             .data_2 (data_2),
                             .data_3 (data_3),
                             .data_out (data_out_est),
                             .valid_0 (valid_0),
                             .valid_1 (valid_1),
                             .valid_2 (valid_2),
                             .valid_3 (valid_3),
                             .valid_out (valid_out_est)
                             );

endmodule


