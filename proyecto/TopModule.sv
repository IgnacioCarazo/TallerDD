/*
testbench
module TopModule(input logic btn_inicio, sw_sel, clk, rst,
					  input logic  [7:0] sw_bit_inicial, 
					  output logic [7:0] display_FB,display_KMP,patron_FB,texto_FB,patron_KMP,texto_KMP,
					  output logic [3:0] actual_state_FB, actual_state_KMP);
					  
					   
	KMP algo_1(sw_sel, btn_inicio, clk, rst, sw_bit_inicial, display_KMP,patron_KMP,texto_KMP, actual_state_KMP); 
	FuerzaBruta algo_2(~sw_sel, btn_inicio, clk, rst, sw_bit_inicial, display_FB, patron_FB, texto_FB, actual_state_FB); 
	
	
	
	
endmodule*/


module TopModule(input logic btn_inicio, sw_sel, clk, rst,
					  input logic  [7:0] sw_bit_inicial, 
					  output logic [6:0] display_FB,display_KMP);
					  
	logic [7:0]instanciasKMP;
	logic [7:0]instanciasFB;

	KMP algo_1(sw_sel, ~btn_inicio, clk, rst, sw_bit_inicial, instanciasKMP); 
	FuerzaBruta algo_2(~sw_sel, ~btn_inicio, clk, rst, sw_bit_inicial, instanciasFB); 
	
	
	convertDisplay instanciaKMP(instanciasKMP,display_KMP);
	
	convertDisplay instanciaFB(instanciasFB,display_FB);
	
		
	
endmodule