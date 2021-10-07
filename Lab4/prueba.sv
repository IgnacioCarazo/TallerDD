module prueba(input logic clk, rst, 
				  input logic [3:0]state, btn,
				  output logic [6:0] display,
				  output logic [3:0] led
				  );


	
	reg [3:0]btn_seleccionado;
	reg [3:0]estado;
	reg enable;
	
	reg [2:0]cost;
	reg to;
	
	
	
	// Descomentar para probar modulo de de servido de ingredientes
	// Dependiendo del estado que se maneja con los switches y el btn estripado muestra el tiempo en display
	
	//sel_boton btn_or(btn, enable);
	
	
	//Register btn_reg(clk, rst, enable, btn, btn_seleccionado);
	
	
	//ing_serving_time_module modulo_tiempo_servido(btn_seleccionado, state, to, display);
	
	
	//assign led = ~btn_seleccionado;
	
	/*********
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// Descomentar para probar modulo de drink_cost
	// ahorita funciona que depende del boton estripado muestra el costo en el display
	
	
	
	
	//sel_boton btn_or(btn, enable);
	
	
	//Register btn_reg(clk, rst, enable, btn, btn_seleccionado);
	
	
	//drink_cost_module(btn_seleccionado, cost, display);
	
	
	// ****************
	


endmodule