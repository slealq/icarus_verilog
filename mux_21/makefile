##
# @file
# @version 0.1

all: mux

mux: testbench
	gtkwave mux.vcd

testbench: verilog
	vvp mux.out

verilog:
	iverilog -o mux.out mux_tb.v

clean:
	rm *.vcd *.out
