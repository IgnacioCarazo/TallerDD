module TopModule(input logic btn_inicio, sw_sel,
					  input logic  [7:0] sw_bit_inicial, 
					  output logic [6:0] display_instancias);
	
	KMP algo_1(sw_sel, btn_inicio,sw_bit_inicial,instancias);
	FuerzaBruta algo_2(~sw_sel, btn_inicio,sw_bit_inicial,instancias);
	
endmodule