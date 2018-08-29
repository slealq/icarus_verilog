##
# basic example for iverilog, gtkwave and yosys
#
# @file
# @version 0.1

all: verilog gtkwave 

gtkwave: trace.vcd
	gtkwave trace.vcd
trace:  
	iverilog -o trace trace.v	
verilog: trace
	vvp trace
yosys: verilog
	yosys yosys.ys	

clean: 
	rm *.vcd trace synth.v

# end
