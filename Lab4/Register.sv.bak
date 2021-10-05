module Register #(parameter N = 8)(input logic clk, rst,
											  input logic [N-1:0] D,
											  output logic [N-1:0] q);
											  
											  
always_ff @(negedge clk or posedge rst)
	if (rst) q = 8'h00;
	else q = D;
									
endmodule