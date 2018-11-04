`timescale 1ns/100ps

`include "contador_gray_cond.v"
`include "contador_gray_tester.v"
`include "contador_gray_synth.v"
`include "./lib/cmos_cells.v"

module contador_gray_tb ();

   wire clk, enable, reset_L;
   wire [4:0] data_out_cond, data_out_est;

         contador_gray_tester tester_  (
                                        .clk (clk),
                                        .reset_L (reset_L),
                                        .enable (enable),
                                        .data_out_cond (data_out_cond),
                                        .data_out_est (data_out_est)
                                        );

         contador_gray_cond cg_cond (
                                     .clk (clk),
                                     .reset_L (reset_L),
                                     .enable (enable),
                                     .data_out (data_out_cond)
                                     );

         contador_gray_synth cg_est (
                                     .clk (clk),
                                     .reset_L (reset_L),
                                     .enable (enable),
                                     .salida_gray (data_out_est)
                                     );

endmodule
