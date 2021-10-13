module prueba(input logic clk, rst, // reset es el switch de mas a la izquierda
				  input logic [3:0]state, btn,
				  input logic moneda100, moneda500,// los estados ahorita se manejan por medio de switches (rojos) ya que la FSM necesita mejoras y los botones van de izq a der -> mocaccino/capuccino/c_leche/expresso
				  output logic [6:0] display_cost, display_time, display_monto, // Display del costo de la bebida y tambien de su tiempo (izquierda=costo/derecha=tiempo)
				  output logic [3:0] led // Estos leds muestran cual boton fue escogido de izquierda a derecha -> mocaccino/capuccino/c_leche/expresso
				  );


	
	reg [3:0]btn_seleccionado;
	reg [3:0]estado;
	reg enable;
	reg seconds; 
	reg [2:0]cost;
	reg to;
	reg alcanza;
	
	
	
	
	
	
	
	// Descomentar para probar modulo de de servido de ingredientes
	// Dependiendo del estado que se maneja con los switches y el btn estripado muestra el tiempo en display
	
	clock_mod clk_mod(seconds, clk); // usar este clock para cualquier modulo que necesite de un clock
	
	sel_boton btn_or(btn, enable);
	
	Sumador sumador_monedas(seconds,rst,moneda100,moneda500,result,display_monto);
	
	
	Register btn_reg(clk_mod, rst, enable, btn, btn_seleccionado);
	
	drink_cost_module bebida(btn_seleccionado, cost, display_cost);
	
	ing_serving_time_module modulo_tiempo_servido(btn_seleccionado, state, to, display_time);
	
	Comparator comparador_plata(cost, result, alcanza);
	
	
	assign led[3:0] = ~btn_seleccionado;
	
	
	
	
	// -----------------------------------------------------------------------------------------------------------------------
	
	// Modulo sumador
	
	// ESTO ES PSEUDOCODIGO!!
	
	//Sumador(valor_moneda, monto_ingresado, nuevo_monto) Sumar moneda ingresada con monto actual
	
	// RegisterSumador registro_monto_ingresado(clk, rst, nuevo_monto, monto_ingresado) Guardar el monto ingresado total
	
	// Comparador(costo, monto_ingresado, out) Revisar que alcance la bebida
	
	//
	


endmodule