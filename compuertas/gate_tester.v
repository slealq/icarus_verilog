module gate_tester (
               output reg in_not,
               output reg in1_nand,
               output reg in2_nand,
               output reg D_flop,
               input      out_not,
               input      out_nand,
               input      Q_flop,
               output reg clk
                    );

   initial
     begin
        $dumpfile("gate_tester_result.vcd");
        $dumpvars;
        #60 $finish; // con el máximo que duran las demás pruebas
     end

   initial
     begin
        // pruebas para la not
        in_not <= 1'b0;

        @(posedge clk);
        in_not <= 1'b1;

        // esto debería durar aproximadamente #20 para que funcione bien
     end

   initial
     begin
        // pruebas para la nand
        in1_nand <= 1'b0;
        in2_nand <= 1'b0;

        @(posedge clk);
        in1_nand <= ~in1_nand;

        @(posedge clk);
        in2_nand <= ~in2_nand;

        @(posedge clk);
        in1_nand <= ~in1_nand;

        // esto debería durar aproximadamente #40
     end

   initial
     begin
        // pruebas para el flip flop
        D_flop <= 1'b0;

        @(posedge clk); // primera prueba
        D_flop <= D_flop;

        @(posedge clk); // segunda prueba
        D_flop <= ~D_flop;

        #18.6 D_flop <= 0; // setup violation

        @(posedge clk);
        #0.4 D_flop <= 1; // hold violation

     end // initial begi

   initial clk <= 0;
   always #10 clk <= ~clk;

endmodule

