module ing_serving_time_module(input logic [3:0]btn, 
										 input logic [3:0]state,
										 output logic to);
										 
										 
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
 
										 
	//if (state == s_servir_agua)
		//if (btn == mocaccino) 
			//to = '1seg';
		//else 
			//to ='2seg';
			
	//else if (state == s_servir_cafe)
		//if (btn == expreso)
			//to = '3seg';
		//else if (btn == c_leche)
			//to = '2seg';
		//else 
			//to = '1seg'
			
	//else if (state == s_servir_leche)
		//if (btn == c_leche)
			//to = '2seg';
		//else if (btn == capuccino)
			//to = '1seg';
			
	//else if (state == s_servir_chocolate)
		//to = '2s';
		
endmodule