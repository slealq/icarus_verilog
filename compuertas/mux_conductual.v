// This should be only the conductual description
module mux_conductual (
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

        if (!reset_L) begin
           data_out <= 4'b0;
           selector <= 'b0;
        end // if

        if (reset_L) begin
           selector <= ~selector;
           if (selector) begin
              data_out <= data_0;
           end else begin
              data_out <= data_1;
           end
        end // if not reset

     end

   endmodule

