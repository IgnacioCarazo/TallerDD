module drink_cost_module(input logic [3:0]btn, 
								 output reg [2:0]cost,
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
  

  
  always @(*)
    begin
	 	  case (btn)
		
		  expreso: //300-3
		  begin
			cost = 3'b011;
			hex_val = 7'b0110000;
		  end
		  c_leche: //400-4
		  begin
			cost = 3'b100;
			hex_val = 7'b0011001;
		  end
		  capuccino://500-5
		  begin
			cost = 3'b101;
			hex_val = 7'b0010010;
		  end
		  mocaccino://700-7
		  begin
			cost = 3'b111;
			hex_val = 7'b1111000;
		  end
		  
			default:  begin 
							cost = 3'b000;
							hex_val = 7'b1111111;
						 end
		endcase
    end 

  


endmodule