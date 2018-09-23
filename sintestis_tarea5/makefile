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

verilog : 
	iverilog -o mux.out mux_tb.v

yosys_ideal: 
	yosys yosys_ideal.ys
	sed -i 's/mux(/mux_estructural_ideal(/g' mux_estructural_ideal.v

yosys_real: 
	yosys yosys_real.ys
	sed -i 's/mux(/mux_estructural_real(/g' mux_estructural_real.v

clean: 
	rm *.vcd *.out mux_estructural_ideal.v mux_estructural_real.v

# end
