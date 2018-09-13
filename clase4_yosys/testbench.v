`timescale 1ns /100ps
`include "switch.v"
`include "switch_tester.v"

module testbench;
   wire sLuz, sButton, sReset, sClk;

   switch switch_( .sLuz (sLuz),
                   .sButton (sButton),
                   .sReset (sReset),
                   .sClk (sClk) );

   switch_tester tester_(.sLuz (sLuz),
                         .sButton (sButton),
                         .sReset (sReset),
                         .sClk (sClk) );

endmodule
