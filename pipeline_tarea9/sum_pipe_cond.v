module sum_pipe_cond (
                     input            clk,
                     input            reset_L,
                     input [3:0]      dataA,
                     input [3:0]      dataB,
                     output reg [3:0] sum30_dd
                     );

   reg [1:0]                     sum10;
   reg [1:0]                     sum10_d;

   reg [3:0]                     dataA_d;
   reg [3:0]                     dataB_d;

   reg                           acarreo;
   reg                           acarreo_d;

   reg [3:0]                     sum30_d;

   always @ (posedge clk) begin
      if (!reset_L) begin
         sum30_dd <= 0;

         sum10 <= 0;
         sum10_d <= 0;

         dataA_d <= 4'b0;
         dataB_d <= 4'b0;

         acarreo <= 0;
         acarreo_d <= 0;

         sum30_d <= 0;

      end else begin // if (!reset_L)

         // etapa 1
         sum10 <= dataA[1:0] + dataB[1:0];
         acarreo <= dataA[0] & dataA[1] & dataB[1] & dataB[0];

         sum10_d <= sum10;
         acarreo_d <= acarreo;

         dataA_d <= dataA;
         dataB_d <= dataB;

         // etapa 2
         sum30_d[3:2] <= dataA_d[3:2] + dataB_d[3:2] + acarreo_d;
         sum30_d[1:0] <= sum10_d;

         sum30_dd <= sum30_d;

      end // else: !if(!reset_L)
   end // always @ (posedge clk)

endmodule
