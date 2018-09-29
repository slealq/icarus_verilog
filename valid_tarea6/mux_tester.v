// Tester module for the mux
module mux_tester (
                   output reg       clk,
                   output reg       reset_L,
                   output reg [3:0] data_0,
                   output reg [3:0] data_1,
                   output reg       valid_0,
                   output reg       valid_1,
                   input [3:0]      data_out_est,
                   input [3:0]      data_out_cond,
                   input            valid_out_cond,
                   input            valid_out_est
                   );

   reg [2:0]                   counter;
   integer                     contador_;

   initial begin
      $dumpfile("mux.vcd");
      $dumpvars;
      contador_ <= 0;
      data_0 <= 4'b0;
      data_1 <= 4'b1;
      reset_L <= 1'b0;

      // valid values set to 0
      valid_0 <= 'b1;
      valid_1 <= 'b1;

      // start counter with 0
      counter <= 'b0;

      // reset_L flip flops and back to 0
      @ (posedge clk);
      reset_L <= 1'b1;

      // iterate through all values
      repeat (16) begin
         @(posedge clk);

         #10;
         counter <= counter + 1;
         contador_ <= contador_ + 1;

         if (counter > 'b1) begin
            data_0 <= data_0 + 1;
            data_1 <= data_1 - 1;
            counter <= 'b0;
         end

         if (contador_ > 4) begin
            valid_0 <= ~ valid_0;
            valid_1 <= ~ valid_1;
            contador_ <= 'b0;
         end

      end

      // end with 0 in data values
      @(posedge clk);
      data_0 = 4'b0;
      data_1 = 4'b0;

      $finish;

   end

   initial clk <= 0;

   always #40 clk <= ~clk;

endmodule
