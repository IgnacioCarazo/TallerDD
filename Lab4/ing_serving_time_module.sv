module ing_serving_time_module(input logic [3:0]btn, 
										 input logic [3:0]state,
										 output logic to,
										 output reg [6:0] hex_val);
										 
										 
	// "ID" botones
  // expreso = 4'b1110
  // c_leche = 4'b1101
  // capuccino = 4'b1011
  // mocaccino = 4'b0111
  
  parameter expreso = 4'b1110;
  parameter c_leche = 4'b1101;
  parameter capuccino = 4'b1011;
  parameter mocaccino = 4'b0111;
  
  parameter s_servir_agua = 4'b0100;
  parameter s_servir_cafe = 4'b0101;
  parameter s_revisa_expreso = 4'b0110;
  parameter s_revisa_leche = 4'b0111;
  parameter s_servir_leche = 4'b1000;
  parameter s_servir_chocolate = 4'b1001;
  parameter s_servir_azucar = 4'b1010;
  
  // HACEN FALTA CORRECCIONES PARA ALGUNOS CASOS PERO FUNCIONA BIEN
   
  always @(*)
    begin
	 	  case (state)
		
		  s_servir_agua: 
			  begin
					if (btn == mocaccino) 
				begin
					hex_val = 7'b1111001;
					//to = '1seg';
				end
			 else 
				begin
					hex_val = 7'b0100100;
					//to ='2seg';
				end
			  end
		  
		  s_servir_cafe:
			  
			  if (btn == expreso)
				begin
					hex_val = 7'b0110000;
					//to = '3seg';
				end
			 else if (btn == c_leche | btn == capuccino)
				begin
					hex_val = 7'b0100100;
					//to = '2seg';
				end
			 else 
				begin
					hex_val = 7'b1111001;
					//to = '1seg'
				end
		  
		  s_servir_leche:
		  
			  if (btn == c_leche)
				begin
					hex_val = 7'b0100100;
					//to = '2seg';
				end
			 else if (btn == capuccino)
				begin
					hex_val = 7'b1111001;
					//to = '1seg';
				end
		  
		  s_servir_chocolate:
		  
				  
				begin
					hex_val = 7'b0100100;
					//to = '2s';
			   end
		  
		  
			default:  begin 
							hex_val = 7'b0000000;
						 end
		endcase
    end 
  
 
										 

		
endmodule