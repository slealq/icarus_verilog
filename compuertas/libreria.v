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

   parameter setup = 1.5; // hay que cambiarlos
   parameter hold  = 0.5;

   realtime             posedge_time, dchange_time;

   always @ (posedge clk)
     begin
        Q <= D;
        posedge_time = $realtime;
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
                     output Q,
                     input A,
                     input B,
                     input S,
                     input Reset_L
                     );

   always @ (*)
     begin

     end

endmodule
