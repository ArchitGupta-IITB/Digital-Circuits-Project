transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/214/Project/Testing/FSM.vhdl}
vcom -93 -work work {E:/214/Project/Testing/zero.vhdl}
vcom -93 -work work {E:/214/Project/Testing/signextend.vhdl}
vcom -93 -work work {E:/214/Project/Testing/RF_DA_IN_MUX.vhdl}
vcom -93 -work work {E:/214/Project/Testing/RF_AD_OUT1_MUX.vhdl}
vcom -93 -work work {E:/214/Project/Testing/RF_AD_IN_MUX.vhdl}
vcom -93 -work work {E:/214/Project/Testing/RF.vhdl}
vcom -93 -work work {E:/214/Project/Testing/priorityencoder.vhdl}
vcom -93 -work work {E:/214/Project/Testing/mem.vhdl}
vcom -93 -work work {E:/214/Project/Testing/LU.vhdl}
vcom -93 -work work {E:/214/Project/Testing/IR.vhdl}
vcom -93 -work work {E:/214/Project/Testing/DATAPATH.vhdl}
vcom -93 -work work {E:/214/Project/Testing/ALU.vhdl}
vcom -93 -work work {E:/214/Project/Testing/T2_MUX.vhd}
vcom -93 -work work {E:/214/Project/Testing/T1_MUX.vhd}
vcom -93 -work work {E:/214/Project/Testing/MEM_ADD_MUX.vhd}
vcom -93 -work work {E:/214/Project/Testing/ALUB_MUX.vhd}
vcom -93 -work work {E:/214/Project/Testing/ALUA_MUX.vhd}

