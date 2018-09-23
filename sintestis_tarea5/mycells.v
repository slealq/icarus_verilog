
module NOT(input A, output Y);
   assign #(1.5:5.05:7.1) Y = ~A;
endmodule

module NAND(input A, input B, output Y);
   assign #(1:3.3:5.1) Y = ~(A & B);
endmodule

module NOR(input A, input B, output Y);
   assign #(0.8:2.2:3.6) Y = ~(A | B);
endmodule

module DFF(input C, input D, output reg Q);
   always @(posedge C)
     #(1.4:3:4.6) Q <= D;
endmodule

