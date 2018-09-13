##
# 
#
# @file
# @version 0.1

all: switch

switch : testbench 
	gtkwave gate_tester_result.vcd

testbench : verilog
	vvp testing.out

verilog : 
	iverilog -o testing.out -T typ testbench.v

clean:
	rm *.out *.vcd


# end
