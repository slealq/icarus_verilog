// Tester module for the mux
module mux_41_tester (
                   output reg       clk,
                   output reg       reset_L,
                   output reg [3:0] data_0,
                   output reg [3:0] data_1,
                   output reg [3:0] data_2,
                   output reg [3:0] data_3,
                   output reg       valid_0,
                   output reg       valid_1,
                   output reg       valid_2,
                   output reg       valid_3,
                   input [3:0]      data_out_cond,
                   input [3:0]      data_out_est,
                   input            valid_out_cond,
                   input            valid_out_est,
                   );

   reg [2:0]                   counter;

   initial begin
      $dumpfile("mux_41.vcd");
      $dumpvars;
      data_0 <= 4'b0000;
      data_1 <= 4'b1010;
      data_2 <= 4'b0101;
      data_3 <= 4'b1111;
      reset_L <= 1'b0;

      // valid values set to 0
      valid_0 <= 'b1;
      valid_1 <= 'b1;
      valid_2 <= 'b1;
      valid_3 <= 'b2;

      // start counter with 0
      counter <= 'b0;

      // reset_L flip flops and back to 0
      @ (posedge clk);
      reset_L <= 1'b1;

      // iterate through all values
      repeat (16) begin
         @(posedge clk);
         counter <= counter + 1;

         if (counter > 'b1) begin
            data_0 <= data_0 + 1;
            data_1 <= data_1 - 1;
            data_2 <= data_2 + 1;
            data_3 <= data_3 - 1;
            counter <= 'b0;
         end

      end

      // end with 0 in data values
      @(posedge clk);
      data_0 = 4'b0;
      data_1 = 4'b0;
      data_2 = 4'b0;
      data_3 = 4'b0;

      $finish;

   end

   initial clk <= 0;

   always #2 clk <= ~clk;

   always #3 valid_0 <= ~valid_0;
   always #4 valid_1 <= ~valid_1;
   always #5 valid_2 <= ~valid_2;
   always #6 valid_3 <= ~valid_3;

endmodule
