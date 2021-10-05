module sel_boton(input logic[3:0] btn,
						output logic btn_sel);
						
	// Este modulo es un OR que sirve para determinar si un boton ha sido pulsado o no.
	
	
  // "ID" botones
  // expreso = 4'b1110
  // c_leche = 4'b1101
  // capuccino = 4'b1011
  // mocaccino = 4'b0111
  
  
	
	assign btn_sel = (btn == 4'b1110 | btn == 4'b1101 | btn == 4'b1011 | btn == 4'b0111);
	

	 

endmodule