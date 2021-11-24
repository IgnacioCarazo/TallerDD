module TopModule(input logic btn_inicio, sw_sel,
					  input logic sw_bit_inicial [7:0], 
					  output logic [6:0] display_instancias);
					  
					  
	// KMP				  
	logic clk, rst, finTexto, inicio, igual, finPatron, menor0;
	logic set_Iniciales, sumaTextoPatron, rstPatron, sumaInstancia, posPorT, sumaTexto;
	logic [3:0] actual_state;		  
							  
	logic [2:0]  address_patron;
	logic [7:0]  address_texto;
	logic [7:0]  patron;
	logic [7:0]  texto;
	logic [7:0]  instancias;

	FSMKMP fsm(clk, rst, finTexto, inicio, igual, finPatron, menor0, set_Iniciales, sumaTextoPatron, rstPatron, sumaInstancia, posPorT, sumaTexto, actual_state);


	Comparator FinTexto(7'd55, address_texto, finTexto);

	Comparator letraIgual(patron, texto, igual);

	Comparator #(3) FinPatron(3'b100, address_patron, finPatron);

	Counter2 contador_instancias(clk, rst | set_Iniciales, sumaInstancia, instancias);

	Comparator #(3) menor(3'd0, address_patron, menor0);

	rom patron_mem(address_patron, clk, patron);
	Counter2 contador_patron(clk, rst | set_Iniciales | rstPatron | posPorT, sumaTextoPatron, address_patron);

	text_rom mem_text(address_texto, clk, texto);
	Counter2 contador_text(clk, rst | set_Iniciales, sumaTextoPatron | sumaTexto, address_texto);
	
	// FUERZA BRUTA
	
	FSM control(clk, rst, fin, igual, pFin, inicio, set_Iniciales, patron_no, patron_si, patron_fin, sumatexto, patron_cero, patron_texto_suma, text_suma, actual_state);


	Comparator finTexto(7'd55, address_texto, fin);

	Comparator letraIgual(patron, texto, igual);

	Comparator #(3) finPatron(3'b100, address_patron, pFin);

	Counter2 contador_instancias(clk, rst, patron_fin, instancias);

	rom patron_mem(address_patron, clk, patron);
	Counter2 contador_patron(clk, rst | patron_fin | patron_no | patron_cero, patron_si | patron_texto_suma, address_patron);

	text_rom mem_text(address_texto, clk, texto);
	Counter2 contador_text(clk, rst, patron_si | patron_fin | patron_texto_suma | text_suma, address_texto);
	
endmodule