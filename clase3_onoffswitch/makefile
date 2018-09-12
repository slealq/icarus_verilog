##
# 
#
# @file
# @version 0.1

all: switch

switch : testbench 
	gtkwave switch.vcd

testbench : verilog
	vvp switch

verilog : 
	iverilog -o switch testbench.v



# end
