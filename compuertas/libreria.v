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

   nand #(1:3.3:5.1, 1:3.3:5.1) (temp, in1, in2);
   not (out, temp);

endmodule // and_delay
