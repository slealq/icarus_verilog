// Tester module for the mux
module mux_tester (
                   output reg clk,
                   output reg reset_L,
                   output reg [3:0] data_0,
                   output reg [3:0] data_1,
                   input [3:0] data_out
                   );
   initial begin
      $dumpfile("mux.vcd");
      $dumpvars;
      data_0 <= 4'b0;
      data_1 <= 4'b1;
      reset <= 1'b0;

      // reset flip flops and back to 0
      @ (posedge clk);
      reset <= 1'b1;

      // iterate through all values
      repeat (16) begin
         @(posedge clk);
         data_0 <= data_0 + 1;
         data_1 <= data_1 - 1;
      end

      // end with 0 in data values
      @(posedge clk);
      data_0 <= 4'b0;
      data_1 <= 4'b0;
   end

   initial clk <= 0;

   always #2 clk <= ~clk;

endmodule
