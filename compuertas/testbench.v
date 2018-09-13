`include "libreria.v"
`include "gate_tester.v"

module testbench;

   wire in_not, in1_nand, in2_nand, out_not, out_nand, d, q, clk;

   not_delay not_ ( .in (in_not),
                    .out (out_not)
                    );

   gate_tester tester_ (.in_not (in_not),
                        .in1_nand (in1_nand),
                        .in2_nand (in2_nand),
                        .out_nand (out_nand),
                        .out_not (out_not),
                        .D_flop (d),
                        .Q_flop (q),
                        .clk (clk)
                        );

   nand_delay nand_ (.in1 (in1_nand),
                   .in2 (in2_nand),
                   .out (out_nand)
                   );

   flip_flop_delay flop_ ( .Q (q),
                           .D (d),
                           .clk (clk)
                           );

endmodule
