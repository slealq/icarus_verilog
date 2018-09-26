##
# Tarea 2 Digitales II
#
# @file
# @version 0.1

all : mux

mux : testbench
	gtkwave mux.vcd

testbench : verilog
	vvp mux.out

verilog : yosys 
	iverilog -o mux.out mux_tb.v

yosys: 
	yosys yosys_real.ys
	sed -i 's/mux(/mux_estructural(/g' mux_estructural.v

clean: 
	rm *.vcd *.out

# end
