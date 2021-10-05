module FSM (
  input clk, rst, enable, cancelar,
  input[3:0] btn,
  
  output reg [2:0] out
);
  reg [3:0] state, next_state;
  
  
  // "ID" botones
  // expreso = 4'b1110
  // c_leche = 4'b1101
  // capuccino = 4'b1011
  // mocaccino = 4'b0111
  
  
  
  
  //estados
  parameter s_esperar_boton = 4'b0000;
  parameter s_revisar_boton = 4'b0001;
  parameter s_revisar_monto = 4'b0010;
  parameter s_devolver_dinero = 4'b0011;
  parameter s_servir_agua = 4'b0100;
  parameter s_servir_cafe = 4'b0101;
  parameter s_revisa_expreso = 4'b0110;
  parameter s_revisa_leche = 4'b0111;
  parameter s_servir_leche = 4'b1000;
  parameter s_servir_chocolate = 4'b1001;
  parameter s_servir_azucar = 4'b1010;
  parameter s_devolver_cambio = 4'b1011;
 
  
  
  //Logica de siguiente estado
  always_comb
    case (state)
      
      s_esperar_boton: if (enable) next_state = s_revisar_boton;
      else next_state = s_esperar_boton;
		
		s_revisar_boton: if (cancelar) next_state = s_devolver_dinero;
      				  else next_state = s_revisar_monto;
      
		s_revisar_monto: if (enable) next_state = s_servir_agua; //cambiar esta condicion por la de si el monto es suficiente
      				  else next_state = s_devolver_dinero;
      
      s_devolver_dinero: next_state = s_esperar_boton;
      
      s_servir_agua: next_state = s_servir_cafe;
    
      s_servir_cafe: next_state = s_revisa_expreso;
      
      s_revisa_expreso: if (4'b1110) next_state = s_servir_azucar;
      					  else next_state = s_revisa_leche;
      
      s_revisa_leche: if (4'b1101 | 4'b1011) next_state = s_servir_leche;
      					  else next_state = s_servir_chocolate;
      
      s_servir_leche: next_state = s_servir_azucar;
      
      s_servir_chocolate: next_state = s_servir_azucar;
      
      s_servir_azucar: next_state = s_devolver_cambio;
      
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
      
      s_revisar_boton: begin
        		      //oout
     				  end
      
      s_revisar_monto: begin
        			  //out
     				  end
      
      s_devolver_dinero: begin
        			  //out
     				  end
      
      s_servir_agua: begin
								out = s_servir_agua;
	   				 end
      
      s_servir_cafe: begin
        		    out = s_servir_cafe;
     				end
      	
      s_revisa_expreso: begin
        			//out
     				end
      
      s_revisa_leche: begin
        			//out
     				  end
      
      s_servir_leche: begin
        			      out = s_servir_leche;
     				  end
      
      s_servir_chocolate:  begin
        		       out = s_servir_chocolate;
     			   end
      s_servir_azucar:  begin
          				out = s_servir_azucar;
        				end
      s_devolver_cambio:  begin
         				 //out
        					end
      endcase
  end
endmodule