module FSM (
  input clk, rst, enable, btn_pulsado, alcanza, // El enable es un booleano que va a decidir si puede avanzar de estado o no
  input logic[3:0] btn,
  
  output logic[3:0] out,
  output logic en
);
  reg [3:0] state, next_state;
  
  
  
  
  // BOTONES
  parameter expreso = 4'b1110;
  parameter c_leche = 4'b1101;
  parameter capuccino = 4'b1011;
  parameter mocaccino = 4'b0111;
  
  
  //ESTADOS
  parameter s_esperar_boton = 4'b0000;
  parameter s_revisar_monto = 4'b0001;
  parameter s_devolver_dinero = 4'b0010;
  parameter s_servir_agua = 4'b0011;
  parameter s_servir_cafe = 4'b0100;
  parameter s_servir_leche = 4'b0101;
  parameter s_servir_chocolate = 4'b0110;
  parameter s_servir_azucar = 4'b0111;
  parameter s_devolver_cambio = 4'b1000;
 
  
  
  //Logica de siguiente estado
  always_comb
    case (state)
      
      s_esperar_boton: if (btn_pulsado) next_state = s_revisar_monto;
								else next_state = s_esperar_boton;
      
		s_revisar_monto: if (alcanza) next_state = s_servir_agua; 
								else next_state = s_devolver_dinero;
      
      s_devolver_dinero: next_state = s_esperar_boton;
      
      s_servir_agua: 	if (enable) next_state = s_servir_cafe;
								else next_state = s_servir_agua;
    
      s_servir_cafe: if (enable & btn == expreso) next_state = s_servir_azucar;
								else if (enable) next_state = s_servir_leche;
								else next_state = s_servir_cafe;
     
      
      s_servir_leche: if ((btn == c_leche | btn == capuccino) & enable) next_state = s_servir_azucar;
      					  else if (enable) next_state = s_servir_chocolate;
							  else next_state = s_servir_leche;
      
      s_servir_chocolate: if (enable) next_state = s_servir_azucar;
									else next_state = s_servir_chocolate;
      
      s_servir_azucar: if (enable) next_state = s_devolver_cambio;
								else next_state = s_servir_azucar;
      
      s_devolver_cambio: next_state = s_esperar_boton;
      
      
      //cantidad de estados es menor a la cantidad de combinaciones de 4 bits
      default: next_state = s_esperar_boton;
      
    endcase
  
  
  //Memoria
  always_ff @(posedge clk) begin
    if (!rst) state = s_esperar_boton;
    else state = next_state;
  end
  
  //Logica de salida
  always @(*) begin
      case (state)
		
		s_esperar_boton: begin
								en = 1'b0;
								out = s_esperar_boton;
								end
      
      s_revisar_monto: begin
						en = 1'b0;
        			   out = s_revisar_monto;
     				  end
      
      s_devolver_dinero: begin
						en = 1'b0;
        			   out = s_devolver_dinero;
     				  end
      
      s_servir_agua: begin
								en = 1'b1;
								out = s_servir_agua;
	   				 end
      
      s_servir_cafe: begin
					 en = 1'b1;
        		    out = s_servir_cafe;
     				end
      
      s_servir_leche: begin
							en = 1'b1;
        			      out = s_servir_leche;
     				  end
      
      s_servir_chocolate:  begin
						 en = 1'b1;
        		       out = s_servir_chocolate;
     			   end
      s_servir_azucar:  begin
							en = 1'b1;
          				out = s_servir_azucar;
        				end
      s_devolver_cambio:  begin
							 en = 1'b0;
         				 out = s_devolver_cambio;
        					end
							
		default: out = 4'b1111;
      endcase
  end
endmodule