// Tester module for the mux
module mux_tester (
                   output reg clk,
                   output reg reset,
                   output reg selector,
                   output reg data_0,
                   output reg data_1,
                   input      data_out
                   );

   reg                        counter;

   initial begin
      $dumpfile("mux.vcd");
      $dumpvars;
      data_0 <= 1'b0;
      data_1 <= 1'b1;
      reset <= 1'b1;
      selector <= 1'b0;

      // start counter with 0
      counter <= 'b0;

      // reset flip flops and back to 0
      @ (posedge clk);
      reset <= 1'b0;

      // iterate through all values
      repeat (8) begin
         @(posedge clk);
         counter = ~counter;

         if (counter == 'b1) begin
            data_0 = ~data_0;
            data_1 = ~data_1;
            selector = ~selector;
         end // if
      end

      data_0 = ~data_0;

      // iterate through all values
      repeat (8) begin
         @(posedge clk);
         counter = ~counter;

         if (counter == 'b1) begin
            data_0 = ~data_0;
            data_1 = ~data_1;
            selector = ~selector;
         end //if

      end

      // end with 0 in data values
      @(posedge clk);
      data_0 = 'b0;
      data_1 = 'b0;

      $finish;

   end

   initial clk <= 0;

   always #2 clk <= ~clk;

endmodule
