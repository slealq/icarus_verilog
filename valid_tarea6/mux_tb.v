`timescale 1ns / 100ps
`include "mux.v"
`include "mux_tester.v"
`include "mux_estructural.v"
`include "mycells.v"

module mux_tb;
   wire reset_L, clk;
   wire [3:0] data_0;
   wire [3:0] data_1;
   wire [3:0] data_out_cond;
   wire [3:0] data_out_est;
   wire       valid_0;
   wire       valid_1;
   wire       valid_out_cond;
   wire       valid_out_est;

   mux mux_( .reset_L (reset_L),
             .clk (clk),
             .data_0 (data_0),
             .data_1 (data_1),
             .data_out (data_out_cond),
             .valid_0 (valid_0),
             .valid_1 (valid_1),
             .valid_out (valid_out_cond)
             );

   mux_tester mux_tester_( .reset_L (reset_L),
                           .clk (clk),
                           .data_0 (data_0),
                           .data_1 (data_1),
                           .data_out_cond (data_out_cond),
                           .data_out_est (data_out_est),
                           .valid_0 (valid_0),
                           .valid_1 (valid_1),
                           .valid_out_cond (valid_out_cond),
                           .valid_out_est (valid_out_est)
                           );

   mux_estructural mux_est_( .reset_L (reset_L),
                             .clk (clk),
                             .data_0 (data_0),
                             .data_1 (data_1),
                             .data_out (data_out_est),
                             .valid_0 (valid_0),
                             .valid_1 (valid_1),
                             .valid_out (valid_out_est)
                             );

endmodule


