// Estructural description of on and off switch

module switch_estructural (
                      output sLuz,
                      input sButton,
                      input sReset,
                      input sClk
                      );
   wire                     reset_not;
   wire                     and_out;
   wire                     sLuz_not;

   not sLuz_not_ (sLuz_not, sLuz);
   not reset_not_ (reset_not, reset);
   and and_1 (and_out, reset_not, sButton, sLuz_not);
   flop flop_1 (sLuz, and_out, sClk);

endmodule

