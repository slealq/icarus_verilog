module block_cond #(
                    parameter BUS_SIZE = 32,
                    parameter WORD_SIZE = 4,
                    parameter WORD_NUM = BUS_SIZE / WORD_SIZE
                    )
                    (
                     input clk,
                     input reset,
                     input [BUS_SIZE-1:0] data_in,
                     output reg error,
                     output reg [BUS_SIZE-1:0] data_out,
                     output [WORD_NUM-1:0] word_bus
                     );

   reg [1:0]                                   state;

   // estructural

   word_cluster_cond wc_cond (
                                 .clk (clk),
                                 .reset (reset),
                                 .data_in (data_in),
                                 .word_bus (word_bus)
                                 );

endmodule
