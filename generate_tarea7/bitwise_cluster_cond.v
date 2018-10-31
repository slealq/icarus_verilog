module bitwise_cluster_cond #(
                              parameter BUS_SIZE = 32;
                              parameter WORD_SIZE = 4;
                              parameter WORD_NUM = BUS_SIZE / WORD_SIZE
                              ) (
                                 input                     clk,
                                 input                     reset,
                                 input [BUS_SIZE-1:0]      data_in;
                                 output reg [WORD_NUM-1:0] bus_control_out;
                                 );


   genvar                                                  i;

   generate
      for (i=0; i < WORD_NUM; i=i+1) begin : CLUSTER
         bitwise_or_cond #(
                           .BUS_SIZE (BUS_SIZE),
                           .WORD_SIZE (WORD_SIZE),
                           .WORD_NUM (WORD_NUM)

                           ) cluster_unit (input clk,
                                           input                                     reset,
                                           input [WORDSIZE*(i+1) - 1 : WORDSIZE*(i)]
                                           );
      end // block: CLUSTER
   endgenerate
endmodule // bitwise_cluster_cond
