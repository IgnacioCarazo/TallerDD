module Comparator #(parameter N = 4)(input logic [N-1:0] A,B,
												 output logic equal);
												 
assign equal = (A >= B);

endmodule