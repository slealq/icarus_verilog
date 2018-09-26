##
# Tarea 2 Digitales II
#
# @file
# @version 0.1

all : mux mux_41

mux : testbench
	gtkwave mux.vcd

mux_41 : testbench_41
	gtkwave mux_41.vcd

testbench : verilog
	vvp mux.out

testbench_41 : verilog_41
	vvp mux_41.out

verilog : yosys 
	iverilog -o mux.out mux_tb.v

verilog_41 : yosys_41
	iverilog -o mux_41.out mux_41_tb.v

yosys: 
	yosys yosys_real.ys
	sed -i 's/mux(/mux_estructural(/g' mux_estructural.v

yosys_41:
	yosys yosys_41.ys
	sed -i 's/mux_41(/mux_41_estructural(/g' mux_41_estructural.v

clean: 
	rm *.vcd *.out

# end
