`timescale 1ns /100ps
`include "switch_estructural.v"
`include "switch_tester.v"
`include "../clase1_onoffswitch/switch.v"
`include "flop.v"

module testbench;
   wire sLuz_conductual, sLuz_estructual, sButton, sReset, sClk;

   switch switch_( .sLuz (sLuz_conductual),
                   .sButton (sButton),
                   .sReset (sReset),
                   .sClk (sClk) );

   switch_estructural switch_estructural ( .sLuz (sLuz_estructural),
                                           .sButton (sButton),
                                           .sReset (sReset),
                                           .sClk (sClk) );

   switch_tester tester_(.sLuz_conductual (sLuz_conductual),
                         .sLuz_estructural (sLuz_estructural),
                         .sButton (sButton),
                         .sReset (sReset),
                         .sClk (sClk) );

endmodule
