module Register #(parameter N = 4)(input logic clk, rst, en,
											  input logic [N-1:0] D,
											  output logic [N-1:0] q);
											  
											  
always_ff @(negedge clk or posedge rst)
	if (rst) q = 1'b0;
	
	else if (en)
		q = D;
	
	
									
endmodule