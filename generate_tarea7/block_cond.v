module block_cond #(
                    parameter BUS_SIZE = 32,
                    parameter WORD_SIZE = 4,
                    parameter WORD_NUM = BUS_SIZE / WORD_SIZE
                    )
                    (
                     input clk,
                     input reset,
                     input [BUS_SIZE-1:0] data_in,
                     output reg error,
                     output [BUS_SIZE-1:0] data_out,
                     output [WORD_NUM-1:0] word_bus
                     );

   reg [1:0]                                   state;
   reg [WORD_SIZE-1:0]                         current_pos;

   // estructural

   word_cluster_cond wc_cond (
                              .clk (clk),
                              .reset (reset),
                              .data_in (data_in),
                              .data_out (data_out),
                              .word_bus (word_bus)
                              );

   always @(posedge clk) begin
      if (!reset) begin
         state <= 0;
         current_pos <= 0;
         error <= 0;
      end else begin
         case (state)
            0: begin
               // state reset
               if  (data_in[BUS_SIZE-1:BUS_SIZE-WORD_SIZE] == {WORD_SIZE{1'b1}}
                    && data_in[WORD_SIZE-1:0] == current_pos) begin
                  state <= 'b00;
                  current_pos <= current_pos + 1;
                  error <= 0;
               end else begin
                  current_pos <= 0;
                  state <= 'b01;
                  error <= 1;
               end
            end

           1 : begin
              // first pkt
              if (data_in[BUS_SIZE-1:BUS_SIZE-WORD_SIZE] == {WORD_SIZE{1'b1}}
                  && data_in[WORD_SIZE-1:0] == current_pos) begin
                 state <= 'b00;
                 current_pos <= current_pos + 1;
                 error <= 0;
              end else begin
                 current_pos <= 0;
                 state <= 'b01;
                 error <= 1;
              end
           end // case: 1

         endcase // case (state)

      end // else: !if(!reset)
   end

endmodule
