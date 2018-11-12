module tester (
               input [3:0]      idx_dd_cond,
               input [3:0]      sum30_dd_cond,
               input [3:0]      idx_dd_est,
               input [3:0]      sum30_dd_est,
               output reg       clk,
               output reg       reset_L,
               output reg [3:0] idx,
               output reg [3:0] dataA,
               output reg [3:0] dataB
               );

   initial begin
      $dumpfile("sum.vcd");
      $dumpvars;

      // put all values at 0
      reset_L <= 0;
      idx <= 0;
      dataA <= 0;
      dataB <= 0;

      #21;
      reset_L <= 1;
      #41;
      dataA <= 'b0101;
      dataB <= 'b1010;

      #100 $finish;

   end

   always @ (posedge clk) begin
      if (sum30_dd_est != sum30_dd_cond) begin
         $display("Diferencia en la salida en %t", $realtime);
      end
   end


   initial clk <= 1;

   always #10 clk <= ~clk;

endmodule // tester
