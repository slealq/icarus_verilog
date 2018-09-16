##
# 
#
# @file
# @version 0.1

all: switch vs

vs : testbench_con_vs_est
	gtkwave vs_tester.vcd

testbench_con_vs_est : verilog_vs
	vvp vs.out	

verilog_vs : 
	iverilog -o vs.out -T typ testbench_con_vs_est.v

switch : testbench_gates 
	gtkwave gate_tester_result.vcd

testbench_gates : verilog
	vvp testing.out

verilog : 
	iverilog -o testing.out -T typ testbench_gates.v

clean:
	rm *.out *.vcd


# end
