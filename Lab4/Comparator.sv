module Comparator #(parameter N = 8)(input [N-1:0] A,B,
												 output equal);
												 
assign equal = (A == B);

endmodule