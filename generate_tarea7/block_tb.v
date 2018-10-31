`timescale 1ns / 100ps
`include "block_cond.v"
`include "block_est.v"
`include "lib/cmos_cells.v"
`include "word_cluster_cond.v"
`include "word_operation_cond.v"
`include "block_tester.v"

module block_tb ();

   wire [31:0] bus_in, bus_out_cond, bus_out_est;
   wire [7:0]  word_bus_cond, word_bus_est;

   block_cond b_cond(/*AUTOINST*/
                     // Outputs
                     .error             (error_cond),
                     .data_out          (bus_out_cond),
                     .word_bus          (word_bus_cond),
                     // Inputs
                     .clk               (clk),
                     .reset             (reset),
                     .data_in           (bus_in));

   block_est b_est(/*AUTOINST*/
                     // Outputs
                     .error             (error_est),
                     .data_out          (bus_out_est),
                     .word_bus          (word_bus_est),
                     // Inputs
                     .clk               (clk),
                     .reset             (reset),
                     .data_in           (bus_in));

   block_tester b_tester (/*AUTOINST*/
                          // Outputs
                          .clk                  (clk),
                          .reset                (reset),
                          .bus_in               (bus_in),
                          // Inpus
                          .bus_out_cond         (bus_out_cond),
                          .bus_out_est          (bus_out_est),
                          .word_bus_cond        (word_bus_cond),
                          .word_bus_est         (word_bus_est),
                          .error_cond           (error_cond),
                          .error_est            (error_est));

endmodule
