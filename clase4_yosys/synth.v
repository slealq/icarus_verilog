/* Generated by Yosys 0.7+655 (git sha1 d36d1193, gcc 8.1.1 -march=x86-64 -mtune=generic -O2 -fstack-protector-strong -fno-plt -fPIC -Os) */

(* top =  1  *)
(* src = "switch.v:1" *)
module switch(sLuz, sButton, sReset, sClk);
  (* src = "switch.v:7" *)
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  (* src = "switch.v:3" *)
  input sButton;
  (* src = "switch.v:5" *)
  input sClk;
  (* src = "switch.v:2" *)
  output sLuz;
  (* src = "switch.v:4" *)
  input sReset;
  NAND _05_ (
    .A(sLuz),
    .B(sButton),
    .Y(_01_)
  );
  NOR _06_ (
    .A(sLuz),
    .B(sButton),
    .Y(_02_)
  );
  NOR _07_ (
    .A(sReset),
    .B(_02_),
    .Y(_03_)
  );
  NAND _08_ (
    .A(_01_),
    .B(_03_),
    .Y(_04_)
  );
  NOT _09_ (
    .A(_04_),
    .Y(_00_)
  );
  (* src = "switch.v:7" *)
  DFF _10_ (
    .C(sClk),
    .D(_00_),
    .Q(sLuz)
  );
endmodule