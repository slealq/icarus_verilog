`timescale 1ns / 100ps
`include "mux_estructural_ideal.v"
`include "mux_estructural_real.v"
`include "mux_tester.v"
`include "mux_conductual.v"
`include "mycells.v"

module mux_tb;
   wire reset_L, clk;
   wire [3:0] data_0;
   wire [3:0] data_1;
   wire [3:0] data_out_estructural_ideal;
   wire [3:0] data_out_estructural_real;
   wire [3:0] data_out_conductual;

   mux_estructural_ideal mux_estructural_ideal_ (.reset_L (reset_L),
                                                 .clk (clk),
                                                 .data_0 (data_0),
                                                 .data_1 (data_1),
                                                 .data_out (data_out_estructural_ideal)
                                                 );

   mux_estructural_real mux_estructural_real_ (.reset_L (reset_L),
                                               .clk (clk),
                                               .data_0 (data_0),
                                               .data_1 (data_1),
                                               .data_out (data_out_estructural_real)
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
                          .data_out_estructural_ideal (data_out_estructural_ideal),
                          .data_out_estructural_real (data_out_estructural_real),
                          .data_out_conductual (data_out_conductual)
                          );
endmodule


