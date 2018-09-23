`timescale 1ns / 100ps
`include "mux_estructural_ideal.v"
`include "mux_tester.v"
`include "mux_conductual.v"

module mux_tb;
   wire reset_L, clk;
   wire [3:0] data_0;
   wire [3:0] data_1;
   wire [3:0] data_out_estructural;
   wire [3:0] data_out_conductual;

   mux_estructural_ideal mux_estructural_ideal_ (.reset_L (reset_L),
                                                 .clk (clk),
                                                 .data_0 (data_0),
                                                 .data_1 (data_1),
                                                 .data_out (data_out_estructural)
                                                 );

   mux_conductual mux_conductual_ (.reset_L (reset_L),
                                   .clk (clk),
                                   .data_0 (data_0),
                                   .data_1 (data_1),
                                   .data_out (data_out_conductual)
                                   );

   mux_tester mux_tester_(.reset_L (reset_L),
                          .clk (clk),
                          .data_0 (data_0),
                          .data_1 (data_1),
                          .data_out_estructural (data_out_estructural),
                          .data_out_conductual (data_out_conductual)
                          );
endmodule


