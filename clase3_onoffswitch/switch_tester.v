module switch_tester (
               output reg sButton,
               output reg sReset,
               output reg sClk,
               input      sLuz_conductual,
               input      sLuz_estructural
               );

   reg                   estructural, conductual;


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

   always @ (posedge sClk) begin
      estructural <= sLuz_estructural;
      conductual <= sLuz_conductual;
   end

   initial sClk <= 0;

   always #2 sClk <= ~sClk;

   always @ (posedge sClk) begin
      if (!sReset) begin
         if (conductual == estructural) begin
            $display("MIEDO_PA");
            end
      end
   end


endmodule

