module ing_serving_time_module(input logic [3:0]btn, // BOTON ESTRIPADO
										 input logic [3:0]state, // ESTADO ACTUAL
										 output logic [3:0]to, // TIEMPO DE SERVIDO
										 output reg [6:0] hex_val); //TEMPORAL PARA MOSTRAR EN DISPLAY SI FUNCIONA
										 
										 
	
  
  
  // BOTONES
  parameter expreso = 4'b1110;
  parameter c_leche = 4'b1101;
  parameter capuccino = 4'b1011;
  parameter mocaccino = 4'b0111;
  
  
  // ESTADOS
  parameter s_servir_agua = 4'b0011;
  parameter s_servir_cafe = 4'b0100;
  parameter s_servir_leche = 4'b0101;
  parameter s_servir_chocolate = 4'b0110;
  parameter s_servir_azucar = 4'b0111;
  

   
  always @(*)
    begin
	 	  case (state)
		
		  s_servir_agua: 
			  
					if (btn == mocaccino) 
			 begin
					hex_val = 7'b1111001;
					to = 4'b0001;
				end
			 else if (btn == c_leche | btn == capuccino | btn == expreso)
				begin
					hex_val = 7'b0100100;
					to =4'b0010;
				end
			 else
				begin
					hex_val = 7'b1000000;
					to = 4'b0000;
				end
			  
		  
		  s_servir_cafe:
			  
			  if (btn == expreso)
				begin
					hex_val = 7'b0110000;
					to = 4'b0011;
				end
			 else if (btn == c_leche | btn == capuccino)
				begin
					hex_val = 7'b0100100;
					to =4'b0010;
				end
			 else 
				begin
					hex_val = 7'b1111001;
					to = 4'b0001;
				end
		  
		  s_servir_leche:
		  
			  if (btn == c_leche)
				begin
					hex_val = 7'b0100100;
					to =4'b0010;
				end
			 else if (btn == capuccino)
				begin
					hex_val = 7'b1111001;
					to = 4'b0001;
				end
			 else 
				begin
					hex_val = 7'b1000000;
					to = 4'b0000;
				end
		  
		  s_servir_chocolate:
		  
				if (btn == mocaccino)  
					begin
						hex_val = 7'b0100100;
						to =4'b0010;
					end
				else
					begin
						hex_val = 7'b1000000;
						to = 4'b0000;
					end
					
				
			s_servir_azucar:
		  
				if (btn == c_leche | btn == capuccino | btn == expreso | btn == mocaccino)
					begin
						hex_val = 7'b1111001;
						to = 4'b0001;
					end
				else
					begin 
							hex_val = 7'b1000000;
							to = 4'b0000;
					end
		  
		  
			default:  begin 
							hex_val = 7'b1000000;
							to = 4'b0000;
						 end
		endcase
    end 
  
 
										 

		
endmodule