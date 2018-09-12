`include "libreria.v"
`include "gate_tester.v"

module testbench;

   wire in, out_not, out_nand;

   not_delay not_ ( .in (in),
                    .out_not (out)
                    );

   gate_tester tester_ (.in (in),
                        .out_nand (out_nand),
                        .out_not (out_not)
                        );

   nand_delay nand_ (.in1 (in1),
                   .in2 (in2),
                   .out_nand (out)
                   );

endmodule
