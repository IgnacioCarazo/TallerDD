module convertDisplay(input logic [7:0]instancias, output logic [6:0] display);


		always @(*)	
		  case (instancias)
			8'b00000000 :      	//Hexadecimal 0
			display = 7'b1000000;
			8'b00000001 :    		//Hexadecimal 1
			display = 7'b1111001  ;
			8'b00000010 :  		// Hexadecimal 2
			display = 7'b0100100 ; 
			8'b00000011 : 		// Hexadecimal 3
			display = 7'b0110000 ;
			8'b00000100 :		// Hexadecimal 4
			display = 7'b0011001;
			8'b00000101 :		// Hexadecimal 5
			display = 7'b0010010 ;  
			8'b00000110 :		// Hexadecimal 6
			display = 7'b0000010;
			8'b00000111 :		// Hexadecimal 7
			display = 7'b1111000;
			8'b00001000 :     	//Hexadecimal 8
			display = 7'b0000000;
			8'b00001001 :    		//Hexadecimal 9
			display = 7'b0010000;
			8'b00001010 :  		// Hexadecimal A
			display = 7'b0001000; 
			8'b00001011 : 		// Hexadecimal B
			display = 7'b0000011;
			8'b00001100 :		// Hexadecimal C
			display = 7'b1000110;
			8'b00001101 :		// Hexadecimal D
			display = 7'b0100001;
			8'b00001110 :		// Hexadecimal E
			display = 7'b0000110;
			8'b00001111 :		// Hexadecimal F
			display = 7'b0001110;
		endcase

endmodule