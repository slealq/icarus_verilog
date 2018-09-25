`timescale 1ns / 100ps
`include "mux.v"
`include "mux_tester.v"

module mux_tb;
   wire reset_L, clk;
   wire [3:0] data_0;
   wire [3:0] data_1;
   wire [3:0] data_out;

   mux mux_( .reset_L (reset_L),
             .clk (clk),
             .data_0 (data_0),
             .data_1 (data_1),
             .data_out (data_out)
             );

   mux_tester mux_tester_(.reset_L (reset_L),
                          .clk (clk),
                          .data_0 (data_0),
                          .data_1 (data_1),
                          .data_out (data_out)
                          );
endmodule


