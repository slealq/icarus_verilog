// Tester module for the mux
module mux_tester (
                   output reg clk,
                   output reg reset_L,
                   output reg [3:0] data_0,
                   output reg [3:0] data_1,
                   input [3:0] data_out_estructural,
                   input [3:0] data_out_conductual
                   );

   reg [2:0]                   counter;
   reg [3:0] estructural, conductual;
   integer   transiciones=0;


   initial begin
      $dumpfile("vs_tester.vcd");
      $dumpvars;
      data_0 <= 4'b0;
      data_1 <= 4'b1;
      reset_L <= 1'b0;

      // start counter with 0
      counter <= 'b0;

      // reset_L flip flops and back to 0
      @ (posedge clk);
      reset_L <= 1'b1;

      // iterate through all values
      repeat (16) begin
         @(posedge clk);
         counter = counter +1;

         if (counter > 'b1) begin
            data_0 = data_0 + 1;
            data_1 = data_1 - 1;
            counter = 'b0;
         end //if

      end

      // end with 0 in data values
      @(posedge clk);
      data_0 = 4'b0;
      data_1 = 4'b0;

      $finish;

   end // initial begin

   always @ (posedge clk) begin
      estructural <= data_out_estructural;
      conductual <= data_out_conductual;
   end

   always @ (posedge clk) begin
      if (reset_L) begin
         if (conductual != estructural) begin
            $display("Inconsistencia miedo a los %t", $realtime);
            end
      end
   end

   always @ (data_out_estructural, data_out_conductual) begin
      transiciones <= transiciones +1;
   end

   initial clk <= 0;

   always #50 clk <= ~clk;

endmodule
