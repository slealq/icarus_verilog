// This will be a 4:1 bit of 4 bits

module mux41 (
              input clk,
              input reset_L,
              input [3:0] data_0,
              input [3:0] data_1,
              input [3:0] data_2,
              input [3:0] data_3,
              input valid_0,
              input valid_1,
              input valid_2,
              input valid_3,
              output reg [3:0] data_out,
              output reg valid_out
              );

   wire [3:0]            from_muxA_to_muxC;
   wire [3:0]            from_muxB_to_muxC;
   wire                  valid_0_muxC;
   wire                  valid_1_muxC;

   mux muxA(clk, reset_L, data_0, data_1, valid_0, valid_1, valid_0_muxC, from_muxA_to_muxC);
   mux muxB(clk, reset_L, data_2, data_3, valid_2, valid_3, valid_1_muxC, from_muxB_to_muxC);
   mux muxC(clk, reset_L, from_muxA_to_muxC, from_muxB_to_muxC, valid_0_muxC, valid_1_muxC, valid_out, data_out);

endmodule
