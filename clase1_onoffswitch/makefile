##
# 
#
# @file
# @version 0.1

all: switch

switch : testbench 
	gtkwave switch.vcd

testbench : verilog
	vvp switch.out

verilog : 
	iverilog -o switch.out testbench.v

clean: 
	rm *.vcd *.out

# end
