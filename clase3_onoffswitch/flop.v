module flop (
             output reg Q,
             input      D,
             input      sClk
             );

   always @ (posedge sClk)
     begin
        Q <= D;
     end

endmodule // flop
