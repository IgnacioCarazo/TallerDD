module drink_cost_module(input logic [3:0]btn, // BOTON PULSADO
								 output reg [3:0]cost, // COSTO DE LA BEBIDA SEGUN BOTON PULSADO
								 output reg [6:0] hex_val); // DISPLAY TEMPORAL PARA VER QUE FUNCIONE
								 
	
	// "ID" botones
  // expreso = 4'b1110
  // c_leche = 4'b1101
  // capuccino = 4'b1011
  // mocaccino = 4'b0111
  
  parameter expreso = 4'b1110;
  parameter c_leche = 4'b1101;
  parameter capuccino = 4'b1011;
  parameter mocaccino = 4'b0111;
  

  
  always @(*)
    begin
	 	  case (btn)
		
		  expreso: //300-3
		  begin
			cost = 4'b0011;
			hex_val = 7'b0110000;
		  end
		  c_leche: //400-4
		  begin 
			cost = 4'b0100;
			hex_val = 7'b0011001;
		  end
		  capuccino://500-5
		  begin
			cost = 4'b0101;
			hex_val = 7'b0010010;
		  end
		  mocaccino://700-7
		  begin
			cost = 4'b0111;
			hex_val = 7'b1111000;
		  end
		  
			default:  begin 
							cost = 3'b0000;
							hex_val = 7'b1000000;
						 end
		endcase
    end 

  


endmodule