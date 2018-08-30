module switch_tester (
               output reg sButton,
               output reg sReset,
               output reg sClk,
               input sLuz
               );

   initial begin
      $dumpfile("switch.vcd");
      $dumpvars;
      {sButton, sReset} <= 2'b0;
      @(posedge sClk);
      sButton <= 1'b0;
      sReset <= 1'b1;
      #10 @(posedge sClk);
      sReset <= 1'b0;
      sButton <= 1'b1;
      #20 @(posedge sClk);
      sReset <= 1'b0;
      $finish;
   end // initial begin

   initial sClk <= 0;

   always #2 sClk <= ~sClk;

endmodule

