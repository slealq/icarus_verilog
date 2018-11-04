
module contador_gray_tester (
                            input [4:0] data_out_cond,
                            input [4:0] data_out_est,
                            output reg  clk,
                            output reg  reset_L,
                            output reg  enable
                            );

   reg [4:0]                            data_out_cond_buff;
   reg [4:0]                            data_out_est_buff;

   initial begin
      $dumpfile("contador.vcd");
      $dumpvars();
   end

   initial begin
      clk = 1;
      enable = 0;
      reset_L = 0;
      data_out_cond_buff = 5'b0;
      data_out_est_buff = 5'b0;

      @ (posedge clk);
      reset_L = 1;
      enable = 1;

      repeat (400) begin
         @ (posedge clk);
      end

      $finish();
   end


   // verificador
   always @(posedge clk) begin
      data_out_cond_buff <= data_out_cond;
      data_out_est_buff <= data_out_est;

       if (data_out_cond_buff != data_out_est_buff) begin
          $display("Diferencia entre el conductual y estructural %t", $realtime);
       end

   end

   always
     begin
        #15 clk = ~clk;
     end

endmodule
