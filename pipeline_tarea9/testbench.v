`timescale 1ns / 100ps
`include "tester.v"
`include "sumador_cond.v"
`include "sumador_est.v"
`include "sum_pipe_cond.v"
`include "mycells.v"

module testbench;

   wire clk, reset_L;
   wire [3:0] idx_dd_cond, sum30_dd_cond;
   wire [3:0] idx_dd_est, sum30_dd_est;
   wire [3:0] idx, dataA, dataB;

   tester tester_ (
                   .clk (clk),
                   .idx_dd_cond (idx_dd_cond),
                   .idx_dd_est (idx_dd_est),
                   .reset_L (reset_L),
                   .idx (idx),
                   .dataA (dataA),
                   .dataB (dataB),
                   .sum30_dd_cond (sum30_dd_cond),
                   .sum30_dd_est (sum30_dd_est)
                   );

   sumador_cond sc (
                    .clk (clk),
                    .idx_dd (idx_dd_cond),
                    .reset_L (reset_L),
                    .idx (idx),
                    .dataA (dataA),
                    .dataB (dataB),
                    .sum30_dd (sum30_dd_cond)
                    );

   sumador_est se (
                   .clk (clk),
                   .idx_dd (idx_dd_est),
                   .reset_L (reset_L),
                   .idx (idx),
                   .dataA (dataA),
                   .dataB (dataB),
                   .sum30_dd (sum30_dd_est)
                   );

endmodule // testbench
