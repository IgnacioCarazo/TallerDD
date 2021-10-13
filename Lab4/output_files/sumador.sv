module sumador #( parameter BITS=4) 
					(input logic [1:0]Monedas, 
					output reg [BITS-1:0]Result);
					
					
		
					
		always @(*)
		begin
		
			case(Monedas)
			
			2'b01:
				 Result=Result+4'b0001;
				
			2'b10:
				 Result=Result+4'b0101;
			
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