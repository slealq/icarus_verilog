// This should be only the conductual description
module mux (
            input            clk,
            input            reset_L,
            input [3:0]      data_0,
            input [3:0]      data_1,
            input            valid_0,
            input            valid_1,
            output reg valid_out,
            output reg [3:0] data_out
            );
   // internal variable
   reg                       selector;

   initial
     begin
        data_out = 0;
        selector = 0;
     end

   always @ (*)
     begin
        // logic for reset is also combinational
        if (reset_L) begin
           if (selector) begin
              valid_out = valid_0;
           end else begin
              valid_out = valid_1;
           end
        end else begin
           valid_out = 0;
        end
     end

   always @ (posedge clk)
     begin
        // initial values
         if (!reset_L) begin
           // combinational logic
           data_out <= 0;
           selector <= 0;
        end

        if (reset_L) begin
           selector <= ~selector;
           if (selector) begin
              if (valid_0) begin
                 data_out <= data_0;
              end
           end else begin
              if (valid_1) begin
                 data_out <= data_1;
              end
           end
        end // if not reset

     end

   endmodule

