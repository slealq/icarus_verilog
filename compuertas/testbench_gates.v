`include "libreria.v"
`include "gate_tester.v"

module testbench_gates;

   wire in_not,
        in1_nand,
        in2_nand,
        out_not,
        out_nand,
        q_mux,
        s,
        a,
        b,
        reset_l,
        d,
        q,
        clk,
        reset_l4,
        s4;

   wire [3:0] Q, A, B;

   not_delay not_ ( .in (in_not),
                    .out (out_not)
                    );

   gate_tester tester_ ( .in_not (in_not),
                         .in1_nand (in1_nand),
                         .in2_nand (in2_nand),
                         .out_nand (out_nand),
                         .out_not (out_not),
                         .D_flop (d),
                         .Q_flop (q),
                         .clk (clk),
                         .Q_mux (q_mux),
                         .A_mux (a),
                         .B_mux (b),
                         .S_mux (s),
                         .Reset_L_mux (reset_l),
                         .Q4 (Q),
                         .A4 (A),
                         .B4 (B),
                         .Reset_L4 (reset_l4),
                         .S4 (s4)
                         );

   nand_delay nand_ ( .in1 (in1_nand),
                      .in2 (in2_nand),
                      .out (out_nand)
                      );

   flip_flop_delay flop_ ( .Q (q),
                           .D (d),
                           .clk (clk)
                           );

   mux_21_delay mux_ ( .Q (q_mux),
                       .A (a),
                       .B (b),
                       .S (s),
                       .Reset_L (reset_l)
                       );

   mux_21_4_delay mux4_ ( .Q (Q),
                        .A (A),
                        .B (B),
                        .Reset_L (reset_l4),
                        .S (s4)
                        );

endmodule
