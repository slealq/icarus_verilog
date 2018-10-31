module word_cluster_cond #(
                              parameter BUS_SIZE = 32,
                              parameter WORD_SIZE = 4,
                              parameter WORD_NUM = BUS_SIZE / WORD_SIZE
                              ) (
                                 input                     clk,
                                 input                     reset,
                                 input [BUS_SIZE-1:0]      data_in,
                                 output [WORD_NUM-1:0] word_bus
                                 );


   genvar                                                  i;

   generate
      for (i=0; i < WORD_NUM; i=i+1) begin : CLUSTER
         word_operation_cond #(
                           .BUS_SIZE (BUS_SIZE),
                           .WORD_SIZE (WORD_SIZE),
                           .WORD_NUM (WORD_NUM)

                           ) cluster_unit ( .clk (clk),
                                            .reset (reset),
                                            .word_in (data_in [WORD_SIZE*(i+1) - 1 : WORD_SIZE*(i)] ),
                                            .word_control_out (word_bus [i])
                                           );
      end // block: CLUSTER
   endgenerate
endmodule // bitwise_cluster_cond
