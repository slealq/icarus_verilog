module switch (
               output reg sLuz,
               input      sButton,
               input      sReset,
               input      sClk );

   always @ (posedge sClk)
     begin
     if (sReset) begin
       sLuz <= 1'b0;
        end
     else if (sButton) begin
       sLuz <= ~sLuz;
        end
     end

endmodule
