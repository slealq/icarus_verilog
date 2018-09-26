// This should be only the conductual description
module mux (
            input            clk,
            input            reset_L,
            input [3:0]      data_0,
            input [3:0]      data_1,
            input            valid_0,
            input            valid_1,
            output reg       valid_out,
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
           valid_out <= 'b0;
        end // if

        if (reset_L) begin
           selector <= ~selector;
           if (selector) begin
              if (valid_0) begin
                 data_out <= data_0;
              end
              valid_out <= valid_0;
              //selector <= 'b0;
           end else begin
              if (valid_1) begin
                 data_out <= data_1;
              end
              valid_out <= valid_1;
              //selector <= 'b1;
           end
        end // if not reset

     end

   endmodule

