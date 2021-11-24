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
	
	/*
	
	FSM control(clk, rst, fin, igual, pFin, inicio, set_Iniciales, patron_no, patron_si, patron_fin, sumatexto, patron_cero, patron_texto_suma, text_suma, actual_state);


	Comparator finTexto(7'd55, address_texto, fin);

	Comparator letraIgual(patron, texto, igual);

	Comparator #(3) finPatron(3'b100, address_patron, pFin);

	Counter2 contador_instancias(clk, rst, patron_fin, instancias);

	rom patron_mem(address_patron, clk, patron);
	Counter2 contador_patron(clk, rst | patron_fin | patron_no | patron_cero, patron_si | patron_texto_suma, address_patron);

	text_rom mem_text(address_texto, clk, texto);
	Counter2 contador_text(clk, rst, patron_si | patron_fin | patron_texto_suma | text_suma, address_texto);*/
	
	
	
	//Salida con cantidad de instancias
	always @(*)
	
	case (instancias)
			8'b00000000 :      //Hexadecimal 0
			display_instancias = 7'b1000000;
			8'b00000001 :    	//Hexadecimal 1
			display_instancias = 7'b1111001  ;
			8'b00000010 :  	// Hexadecimal 2
			display_instancias = 7'b0100100 ; 
			8'b00000011 : 		// Hexadecimal 3
			display_instancias = 7'b0110000 ;
			8'b00000100 :		// Hexadecimal 4
			display_instancias = 7'b0011001;
			8'b00000101 :		// Hexadecimal 5
			display_instancias = 7'b0010010 ;  
			8'b00000110 :		// Hexadecimal 6
			display_instancias = 7'b0000010;
			8'b00000111 :		// Hexadecimal 7
			display_instancias = 7'b1111000;
			8'b00001000 :     //Hexadecimal 8
			display_instancias = 7'b0000000;
			8'b00001001 :    	//Hexadecimal 9
			display_instancias = 7'b0010000;
			8'b00001010 :  	// Hexadecimal A
			display_instancias = 7'b0001000; 
			8'b00001011 : 		// Hexadecimal B
			display_instancias = 7'b0000011;
			8'b00001100 :		// Hexadecimal C
			display_instancias = 7'b1000110;
			8'b00001101 :		// Hexadecimal D
			display_instancias = 7'b0100001;
			8'b00001110 :		// Hexadecimal E
			display_instancias = 7'b0000110;
			8'b00001111 :		// Hexadecimal F
			display_instancias = 7'b0001110;
	endcase
	
endmodule