module sumador_cond (
                     input        clk,
                     input        reset_L,
                     input [3:0]  idx,
                     input [3:0]  dataA,
                     input [3:0]  dataB,
                     output reg [3:0] idx_dd,
                     output [3:0] sum30_dd
                     );

   reg [3:0]                      idx_d;

   sum_pipe_cond spc (
                      .clk (clk),
                      .reset_L (reset_L),
                      .dataA (dataA),
                      .dataB (dataB),
                      .sum30_dd (sum30_dd)
                      );

   always @ (posedge clk) begin
      if (!reset_L) begin
         idx_d <= 0;
         idx_dd <= 0;
      end else begin
         idx_d <= idx + 1;
         idx_dd <= idx_d + 1;
      end
   end

endmodule
