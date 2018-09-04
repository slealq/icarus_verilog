// This should be only the conductual description
module mux (
            input clk,
            input reset_L,
            input [3:0] data_0,
            input [3:0] data_1,
            output reg [3:0] data_out
            );
   // internal variable
   reg                       selector = 1b'0;

   always @ (posedge clk)
     begin
        selector <= ~clk;
     end

   endmodule

