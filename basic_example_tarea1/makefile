##
# basic example for iverilog, gtkwave and yosys
#
# @file
# @version 0.1

CC = iverilog

all: verilog gtkwave 

gtkwave: trace
	vvp trace
verilog: 
	iverilog -o trace trace.v	

# end
