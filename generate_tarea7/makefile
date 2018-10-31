all: yosys sim

yosys:
	yosys -s synth_script.ys
	sed -i "s/word_cluster_cond/word_cluster_est/g" block_est.v
	sed -i "s/word_operation_cond/word_operation_est/g" block_est.v
	sed -i "s/block_cond/block_est/g" block_est.v

sim:
	iverilog -o block.out block_tb.v
	vvp block.out
	gtkwave block.gtkw

clean:
	rm memory_cluster_synth.v generate_example rtlil.v *.dot *.vcd *.out

