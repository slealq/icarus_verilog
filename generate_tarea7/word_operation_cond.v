module word_operation_cond #(
                              parameter BUS_SIZE = 32,
                              parameter WORD_SIZE = 4,
                              parameter WORD_NUM = BUS_SIZE / WORD_SIZE
                              )
   (input clk,
    input                      reset, // low reset
    input [WORD_SIZE-1:0]      word_in,
    output reg [WORD_SIZE-1:0] word_out,
    output reg                 word_control_out);

   always @ (posedge clk) begin
      if (reset) begin
         word_control_out <= | word_in;
         word_out <= word_in;
      end else begin
         word_control_out <= 0;
         word_out <= 0;
      end
   end

endmodule // bitwise_cluster_cond
