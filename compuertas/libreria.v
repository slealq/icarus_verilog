`timescale 1ns/100ps

module not_delay (
                  input  in,
                  output out
                  );

   parameter PwrC = 0.00003;

   not #(1.5:5.05:7.1, 1.5:5.05:7.1) (out, in);

endmodule // not_delay

module nand_delay (
                  input  in1,
                  input  in2,
                  output out
                  );

   wire                  temp;

   parameter PwrC = 0.00003;

   and #(1:3.3:5.1, 1:3.3:5.1) (temp, in1, in2);
   not (out, temp);

endmodule // and_delay

module flip_flop_delay (
                        output reg Q,
                        input D,
                        input clk
                        );

   parameter PwrC = 0.00003;
   parameter setup = 1.5; // hay que cambiarlos
   parameter hold  = 0.5;

   realtime             posedge_time, dchange_time;

   initial
     begin
        Q <= 1'b0; // si no se indefine por siempre
     end

   always @ (posedge clk)
     begin
        posedge_time = $realtime;
        #(1.4:3:4.6) Q <= D; // solo estoy asignando el tiempo typ
        if (posedge_time - dchange_time < setup )
          begin
             $display("Error de setup a los %t", posedge_time);
          end
     end

   always @ (D)
     begin
        dchange_time = $realtime;
        if (dchange_time - posedge_time < hold)
          begin
             $display("Error de hold a los %t", dchange_time);
          end
     end

endmodule // flip_flop_delay

module mux_21_delay (
                     output reg Q,
                     input A,
                     input B,
                     input S,
                     input Reset_L
                     );

   parameter PwrC = 0.00003;

   wire                    nand_a_out,
                           selector_out,
                           nand_b_out,
                           a_and_b_not,
                           out_not,
                           out;

   nand_delay nand_a (A, !S, nand_a_out);
   //nand_delay selector (S, S, selector_out);
   nand_delay nand_b (B, S, nand_b_out);
   nand_delay a_and_b_not_ (nand_a_out, nand_b_out, a_and_b_not);
   nand_delay reset_out (a_and_b_not, Reset_L, out_not);
   not_delay out_ (out_not, out);

   always @ (out)
     begin
        Q <= out;
     end

   // always @ (*)
   //   begin
   //      if (S == 0 & Reset_L == 1)
   //        begin
   //           #(2:4.5:13) Q = A;
   //        end
   //      else if (S == 1 & Reset_L == 1)
   //        begin
   //           #(2:4.5:13) Q = B;
   //        end
   //      else
   //        begin
   //           #(2:4.5:13) Q = 0;
   //        end
   //   end

endmodule

module mux_21_4_delay (
                       output [3:0] Q,
                       input [3:0] A,
                       input [3:0] B,
                       input S,
                       input Reset_L
                       );

   parameter PwrC = 0.000015;

   mux_21_delay bit_0 (Q[0], A[0], B[0], S, Reset_L);
   mux_21_delay bit_1 (Q[1], A[1], B[1], S, Reset_L);
   mux_21_delay bit_2 (Q[2], A[2], B[2], S, Reset_L);
   mux_21_delay bit_3 (Q[3], A[3], B[3], S, Reset_L);

endmodule
