module prueba(input logic clk, rst, // reset es el switch de mas a la izquierda
				  input logic [3:0]state, btn,
				  input logic moneda100, moneda500,// los estados ahorita se manejan por medio de switches (rojos) ya que la FSM necesita mejoras y los botones van de izq a der -> mocaccino/capuccino/c_leche/expresso
				  output logic [6:0] display_cost, display_time, display_monto, // Display del costo de la bebida y tambien de su tiempo (izquierda=costo/derecha=tiempo)
				  output logic [3:0] led,
				  output led_alcanza,
				  output logic [6:0]display_alcanza
				  );


	
	reg [3:0]btn_seleccionado;
	reg [3:0]estado;
	reg enableBTN, enableFSM, seconds, to, en, Q, alcanza; 
	reg [3:0]cost, result,outFSM;
	
	
	
	
	
	
	
	
	
	
	// Descomentar para probar modulo de de servido de ingredientes
	// Dependiendo del estado que se maneja con los switches y el btn estripado muestra el tiempo en display
	
   FSM maquina_estados(seconds, rst, enableFSM, enableBTN, alcanza, btn_seleccionado, outFSM, en);
	
	clock_mod clk_mod(seconds, clk); 
	
	sel_boton btn_or(btn, enableBTN);
	
	Sumador sumador_monedas(seconds,rst,moneda100,moneda500,result,display_monto);
	
	Register btn_reg(seconds, rst, enableBTN, btn, btn_seleccionado);
	
	drink_cost_module bebida(btn_seleccionado, cost, display_cost);
	
	ing_serving_time_module modulo_tiempo_servido(btn_seleccionado, outFSM, to, display_time);
	
	Comparator comparador_plata(result, cost, alcanza);
	
	assign led_alcanza = alcanza;
	
	Counter contador(seconds, enableFSM, en, Q);
	
	Comparator comparador_tiempos(Q, to, enableFSM);
	
	
	assign led[3:0] = outFSM;
	
	always @(*)
			case (alcanza)
			4'b0000 :      	//Hexadecimal 0
			display_alcanza = 7'b1000000;
			4'b0001 :    		//Hexadecimal 1
			display_alcanza = 7'b1111001  ;
			4'b0010 :  		// Hexadecimal 2
			display_alcanza = 7'b0100100 ; 
			4'b0011 : 		// Hexadecimal 3
			display_alcanza = 7'b0110000 ;
			4'b0100 :		// Hexadecimal 4
			display_alcanza = 7'b0011001;
			4'b0101 :		// Hexadecimal 5
			display_alcanza = 7'b0010010 ;  
			4'b0110 :		// Hexadecimal 6
			display_alcanza = 7'b0000010;
			4'b0111 :		// Hexadecimal 7
			display_alcanza = 7'b1111000;
			4'b1000 :     		 //Hexadecimal 8
			display_alcanza = 7'b0000000;
			4'b1001 :    		//Hexadecimal 9
			display_alcanza = 7'b0010000;
			4'b1010 :  		// Hexadecimal A
			display_alcanza = 7'b0001000; 
			4'b1011 : 		// Hexadecimal B
			display_alcanza = 7'b0000011;
			4'b1100 :		// Hexadecimal C
			display_alcanza = 7'b1000110;
			4'b1101 :		// Hexadecimal D
			display_alcanza = 7'b0100001;
			4'b1110 :		// Hexadecimal E
			display_alcanza = 7'b0000110;
			4'b1111 :		// Hexadecimal F
			display_alcanza = 7'b0001110;
		endcase
	
	
	
	
	


endmodule