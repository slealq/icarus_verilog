module gate_tester (
                    output reg in_not,
                    output reg in1_nand,
                    output reg in2_nand,
                    output reg D_flop,
                    output reg A_mux,
                    output reg B_mux,
                    output reg S_mux,
                    output reg Reset_L_mux,
                    input      out_not,
                    input      out_nand,
                    input      Q_flop,
                    input      Q_mux,
                    output reg clk,
                    input [3:0] Q4,
                    output reg [3:0] A4,
                    output reg [3:0] B4,
                    output reg Reset_L4,
                    output reg S4
                    );

   initial
     begin
        $dumpfile("gate_tester_result.vcd");
        $dumpvars;
        #100 $finish; // con el máximo que duran las demás pruebas
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

     end // initial pruebas flip flop

   initial
     begin
        // pruebas para el mux
        A_mux <= 1;
        B_mux <= 0;
        S_mux <= 0;
        Reset_L_mux <= 0;

        #24 Reset_L_mux <= 1;

        // varias valores de A y B
        #24 A_mux <= 0;
        B_mux <= 1;

        #24 S_mux <= 1;
        #24 Reset_L_mux <= 0;

     end

   initial
     begin
        // pruebas para el mux de 4 bits
        A4 <= 4'b1010;
        B4 <= 4'b0101;
        S4 <= 0;
        Reset_L4 <= 0;

        #24 Reset_L4 <= 1;

        // variar valores de a y b
        #24 A4 <= 4'b0110;
        B4 <= 4'b1001;

        #24 S4 <= 1;
        #24 Reset_L4 <= 0;

     end

   initial clk <= 0;
   always #10 clk <= ~clk;

endmodule

