module block_tester #(
                      parameter BUS_SIZE = 32,
                      parameter WORD_SIZE = 4,
                      parameter WORD_NUM = BUS_SIZE / WORD_SIZE
                      ) (
                     output reg                  clk,
                     output reg                  reset,
                     output reg [BUS_SIZE-1 : 0] bus_in,
                     input [BUS_SIZE-1 : 0]      bus_out_cond,
                     input [BUS_SIZE-1 : 0]      bus_out_est,
                     input [WORD_NUM-1 : 0]      word_bus_cond,
                     input [WORD_NUM-1 : 0]      word_bus_est,
                     input                       error_cond,
                     input                       error_est
                         );

   initial begin
      $dumpfile("block.vcd");
      $dumpvars;

      reset <= 'b0;
      bus_in <= 'b1;

      #50 reset <= 'b1;

      repeat (31) begin
         @(posedge clk);

         bus_in <= bus_in << 1;

      end

      $finish;

   end // initial begin

   always @ (posedge clk) begin
      if (reset) begin
         $display("Iniciando con las verificaciones en %t", $realtime);
         if (bus_out_est !== bus_out_cond) begin
            $display("Diferencia en el bus out");
         end

         if (word_bus_est !== word_bus_cond) begin
            $display("Diferencia en el bus de word");
         end

         if (error_est !== error_cond) begin
            $display("Diferencia en el bit de error");
         end
      end // if (!reset)
   end

   initial clk <= 0;

   always #40 clk <= ~clk;

endmodule // block_tester
