vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../ALU.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../ALU.srcs/sources_1/ip/vio_0/hdl" "+incdir+../../../../ALU.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../ALU.srcs/sources_1/ip/vio_0/hdl" \
"../../../../ALU.srcs/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

