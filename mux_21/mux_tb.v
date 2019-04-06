`timescale 1ns / 100ps
`include "mux.v"
`include "mux_tester.v"

module mux_tb;
   wire reset, data_0, data_1, data_out, selector;

   mux mux_( .reset (reset),
             .selector (selector),
             .data_0 (data_0),
             .data_1 (data_1),
             .data_out (data_out)
             );

   mux_tester mux_tester_(.reset (reset),
                          .selector (selector),
                          .data_0 (data_0),
                          .data_1 (data_1),
                          .data_out (data_out)
                          );
endmodule
