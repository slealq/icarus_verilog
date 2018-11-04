module contador_gray_cond (
                           input        clk,
                           input        reset_L,
                           input        enable,
                           output [4:0] data_out
                           );

   reg [4:0]                                count;

   always @ (posedge clk) begin
     if (!reset_L) begin
       count <= 0;
     end else if (enable) begin
       count <= count + 1;
     end
   end

   assign data_out = { count[4],
                       (count[4] ^ count[3]),
                       (count[3] ^ count[2]),
                       (count[2] ^ count[1]),
                       (count[1] ^ count[0]) };
endmodule
