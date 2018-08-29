// Ejemplo de un contador, en un solo modulo

module trace ;

   reg       clk = 0;
   reg [3:0] a = 4'd0;
   reg       b = 0;

   always #1 clk = ~clk;
   always @(posedge clk) begin
      a = a+1; b = a[2]; end

   initial begin
      $dumpfile("trace.vcd");
      $dumpvars(0, trace); // all vars

   end endmodule // trace
