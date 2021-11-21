module GreaterAThanB #(parameter N = 8) 
							 (input [N-1:0] A, B,
							  output greater);
						
assign greater = (A>B);
endmodule
