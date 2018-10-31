module bitwise_or_cond #(
                              parameter BUS_SIZE = 32,
                              parameter WORD_SIZE = 4,
                              parameter WORD_NUM = BUS_SIZE / WORD_SIZE
                              )
   (input clk,
    input                 reset,
    input [WORD_SIZE-1:0] word_in,
    output reg            word_control_out);

   always @ (posedge clk) begin
      word_control_out <= | word_in;
   end

endmodule // bitwise_cluster_cond
