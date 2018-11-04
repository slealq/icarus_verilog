all : simulation

simulation : testbench
	gtkwave gray.gtkw &

testbench : verilog
	vvp gray.out

verilog :
	iverilog -o gray.out contador_gray_tb.v
