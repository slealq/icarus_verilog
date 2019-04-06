module mux (
            input      selector,
            input      reset,
            input      data_0,
            input      data_1,
            output reg data_out
            );

   always @ (*) begin
      if (!reset) begin
         if (selector) begin
            data_out = data_1;
         end else begin
            data_out = data_0;
         end
      end
   end

   endmodule
