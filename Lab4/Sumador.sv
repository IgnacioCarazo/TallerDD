module Sumador #( parameter BITS=4) 
					(seconds,rst,moneda100,moneda500,result,display);
					
		input logic seconds,rst;
		input logic moneda100, moneda500;
		output reg [3:0] result;
		output logic [6:0]display;
		
		
				
		always @(posedge seconds or posedge rst)
		

		if (rst) result <= 4'b0000;
		
		else begin
			if(moneda100) begin 
		
			if (result < 4'b1010) 
			result = result +4'b0001;
			end
		else if (moneda500) begin 
			if (result < 4'b0110) result= result + 4'b0101;
			end 


			
		case (result)
			4'b0000 :      	//Hexadecimal 0
			display = 7'b1000000;
			4'b0001 :    		//Hexadecimal 1
			display = 7'b1111001  ;
			4'b0010 :  		// Hexadecimal 2
			display = 7'b0100100 ; 
			4'b0011 : 		// Hexadecimal 3
			display = 7'b0110000 ;
			4'b0100 :		// Hexadecimal 4
			display = 7'b0011001;
			4'b0101 :		// Hexadecimal 5
			display = 7'b0010010 ;  
			4'b0110 :		// Hexadecimal 6
			display = 7'b0000010;
			4'b0111 :		// Hexadecimal 7
			display = 7'b1111000;
			4'b1000 :     		 //Hexadecimal 8
			display = 7'b0000000;
			4'b1001 :    		//Hexadecimal 9
			display = 7'b0010000;
			4'b1010 :  		// Hexadecimal A
			display = 7'b0001000; 
			4'b1011 : 		// Hexadecimal B
			display = 7'b0000011;
			4'b1100 :		// Hexadecimal C
			display = 7'b1000110;
			4'b1101 :		// Hexadecimal D
			display = 7'b0100001;
			4'b1110 :		// Hexadecimal E
			display = 7'b0000110;
			4'b1111 :		// Hexadecimal F
			display = 7'b0001110;
		endcase
			
		end
		

endmodule


/*module sumador #( parameter BITS=4) 
					(input logic clk, rst, en,
					input logic [1:0]Monedas, 
					output logic [BITS-1:0]Result);
					
					
		reg[BITS-1:0] tmp_result;
		tmp_result = 4'b0000;
		
		Register registro(clk, rst, en, 3'b001, suma100, tmp_result);
		
		N_bit_adder sumador100(tmp_result,3'b001,suma100,carry_adder);
		N_bit_adder sumador500(tmp_result,3'b101,suma500,carry_adder);
		
		
		always @(*)
		begin
		
			case(Monedas)
			
			2'b01:
				assign tmp_result=suma100;
				
			2'b10:
				assign tmp_result=suma500;
			
			endcase
			
			assign Result=tmp_result;
		
		end

endmodule*/