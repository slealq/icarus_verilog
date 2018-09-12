module gate_tester (
               output reg in_not,
               output reg in1_nand,
               output reg in2_nand,
               input      out_not,
               output reg clk
                    );

   initial begin
      $dumpfile("gate_tester_result.vcd");
      $dumpvars;

      // valores iniciales
      in_not <= 1'b0;

      // valores iniciales
      in1_nand <= 1'b0;
      in2_nand <= 1'b1;

      repeat (4) begin
         // pruebas del not
         @(posedge clk);
         in_not <= ~in_not;

         // pruebas del nand
         in1_nand <= ~in1_nand;
         in2_nand <= ~in2_nand;

      end

      $finish;
   end // initial begi

   initial clk <= 0;

   always #6 clk <= ~clk;

endmodule

