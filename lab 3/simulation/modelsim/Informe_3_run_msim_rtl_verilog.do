transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Pc/Desktop/informe_3 {C:/Users/Pc/Desktop/informe_3/ALU.sv}
vlog -sv -work work +incdir+C:/Users/Pc/Desktop/informe_3 {C:/Users/Pc/Desktop/informe_3/ALU_tb.sv}

vlog -sv -work work +incdir+C:/Users/Pc/Desktop/informe_3 {C:/Users/Pc/Desktop/informe_3/tb_N_bit_adder.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_N_bit_adder.sv

add wave *
view structure
view signals
run -all
