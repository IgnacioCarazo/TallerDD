module prueba(input logic clk, rst,
				  input logic [3:0]btn,
				  output logic [3:0]led,
				  output logic [6:0]display);


	reg [3:0]btn_seleccionado;
	reg [2:0]cost;
	
	reg enable;
	
	
	
	
	
	
	sel_boton btn_or(btn, enable);
	
	
	Register btn_reg(clk, rst, enable, btn, btn_seleccionado);
	
	drink_cost_module(btn_seleccionado, cost, display);
	
	
	assign led = ~btn_seleccionado;
	

	

	
	

endmodule