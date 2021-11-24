module TopModule(input logic btn_inicio, sw_sel, clk, rst,
					  input logic  [7:0] sw_bit_inicial, 
					  output logic [6:0] display_instancias);
					  
					   
	KMP algo_1(sw_sel, btn_inicio, clk, rst, sw_bit_inicial, instancias); 
	FuerzaBruta algo_2(~sw_sel, btn_inicio, clk, rst, sw_bit_inicial, instancias); 
	
	
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