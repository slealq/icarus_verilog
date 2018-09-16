// Estructural description of on and off switch
`include "libreria.v"

module mux_estructural (
            input clk,
            input reset_L,
            input [3:0] data_0,
            input [3:0] data_1,
            output [3:0] data_out
            );
   // internal variable
   wire                  q,
                         q_not,
                         d_not,
                         d;

   mux_21_4_delay mux_ (data_out, data_0, data_1, q, reset_L);
   nand_delay nand_ (q_not, reset_L, d_not);
   not_delay not_nand_ (d_not, d);
   flip_flop_delay flop_ (q, d, clk);
   not_delay not_q_ (q, q_not);

endmodule

