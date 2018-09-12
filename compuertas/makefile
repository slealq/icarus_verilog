##
# 
#
# @file
# @version 0.1

all: switch

switch : testbench 
	gtkwave gate_tester_result.vcd

testbench : verilog
	vvp testing

verilog : 
	iverilog -o testing testbench.v



# end
