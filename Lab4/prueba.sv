module prueba(input logic clk, rst, // reset es el switch de mas a la izquierda
				  input logic [3:0]state, btn,
				  input logic moneda100, moneda500,// los estados ahorita se manejan por medio de switches (rojos) ya que la FSM necesita mejoras y los botones van de izq a der -> mocaccino/capuccino/c_leche/expresso
				  output logic [6:0] display_cost, display_time, display_monto, // Display del costo de la bebida y tambien de su tiempo (izquierda=costo/derecha=tiempo)
				  output logic [3:0] led,
				  output led_alcanza // Estos leds muestran cual boton fue escogido de izquierda a derecha -> mocaccino/capuccino/c_leche/expresso
				  );


	
	reg [3:0]btn_seleccionado;
	reg [3:0]estado;
	reg enableBTN, enableFSM, seconds, to, en, Q, alcanza; 
	reg [3:0]cost, outFSM;
	
	
	
	
	
	
	
	
	
	// Descomentar para probar modulo de de servido de ingredientes
	// Dependiendo del estado que se maneja con los switches y el btn estripado muestra el tiempo en display
	
   FSM maquina_estados(seconds, rst, enableFSM, enableBTN, alcanza, btn_seleccionado, outFSM, en);
	
	clock_mod clk_mod(seconds, clk); 
	
	sel_boton btn_or(btn, enableBTN);
	
	Sumador sumador_monedas(seconds,rst,moneda100,moneda500,result,display_monto);
	
	Register btn_reg(clk_mod, rst, enableBTN, btn, btn_seleccionado);
	
	drink_cost_module bebida(btn_seleccionado, cost, display_cost);
	
	ing_serving_time_module modulo_tiempo_servido(btn_seleccionado, outFSM, to, display_time);
	
	Comparator comparador_plata(result, cost, alcanza);
	
	assign led_alcanza = alcanza;
	
	Counter contador(seconds, enableFSM, en, Q);
	
	Comparator comparador_tiempos(Q, to, enableFSM);
	
	
	assign led[3:0] = ~btn_seleccionado;
	
	
	
	
	
	


endmodule