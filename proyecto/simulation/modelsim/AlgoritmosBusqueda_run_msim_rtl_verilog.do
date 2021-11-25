transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Ignacio\ Carazo/Desktop/TallerDD/proyecto {C:/Users/Ignacio Carazo/Desktop/TallerDD/proyecto/rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/Ignacio\ Carazo/Desktop/TallerDD/proyecto {C:/Users/Ignacio Carazo/Desktop/TallerDD/proyecto/example.v}
vlog -sv -work work +incdir+C:/Users/Ignacio\ Carazo/Desktop/TallerDD/proyecto {C:/Users/Ignacio Carazo/Desktop/TallerDD/proyecto/FSM.sv}
vlog -sv -work work +incdir+C:/Users/Ignacio\ Carazo/Desktop/TallerDD/proyecto {C:/Users/Ignacio Carazo/Desktop/TallerDD/proyecto/FuerzaBruta.sv}
vlog -sv -work work +incdir+C:/Users/Ignacio\ Carazo/Desktop/TallerDD/proyecto {C:/Users/Ignacio Carazo/Desktop/TallerDD/proyecto/Comparator.sv}
vlog -sv -work work +incdir+C:/Users/Ignacio\ Carazo/Desktop/TallerDD/proyecto {C:/Users/Ignacio Carazo/Desktop/TallerDD/proyecto/Counter2.sv}
vlog -sv -work work +incdir+C:/Users/Ignacio\ Carazo/Desktop/TallerDD/proyecto {C:/Users/Ignacio Carazo/Desktop/TallerDD/proyecto/TopModule.sv}
vlog -sv -work work +incdir+C:/Users/Ignacio\ Carazo/Desktop/TallerDD/proyecto {C:/Users/Ignacio Carazo/Desktop/TallerDD/proyecto/TopModule_tb.sv}

