// This should be only the conductual description
module mux (
            input clk,
            input reset_L,
            input [3:0] data_0,
            input [3:0] data_1,
            output reg [3:0] data_out
            );
   // internal variable
   reg                       selector;

   always @ (posedge clk)
     begin
        // initial values

        if (reset_L) begin
           selector <= 1'b0;
           data_out <= 4'b0;
        end // if

        if (!reset_L) begin
          selector <= ~selector;
        end // if

     end

   endmodule

