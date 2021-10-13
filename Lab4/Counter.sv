module Counter #(parameter N = 4)(input clk, rst, en,
											 output [N-1:0] Q);
											 
always_ff @(negedge clk or posedge rst)
	if (rst) Q = 4'b0000;
	else if (en) Q = Q + 4'b0001;
									
endmodule