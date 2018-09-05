##
# Tarea 2 Digitales II
#
# @file
# @version 0.1

all : mux

mux : testbench
	gtkwave mux.vcd

testbench : verilog
	vvp mux

verilog : 
	iverilog -o mux mux_tb.v


# end
