##
# Sumador
#
# @file
# @version 0.1

all : yosys verilog

verilog :
	iverilog -o sum.out testbench.v
	vvp sum.out
	gtkwave sum.gtkw

yosys :
	yosys yosys.ys
	sed -i "s/sum_pipe_cond(/sum_pipe_est(/g" sumador_est.v;
	sed -i "s/sum_pipe_cond /sum_pipe_est /g" sumador_est.v;
	sed -i "s/sumador_cond(/sumador_est(/g" sumador_est.v;

# end
