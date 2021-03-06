module suma #(parameter N = 8) (input clk, rst, en, 
											input logic [7:0] num, 
												output logic [N-1:0] Q);					

always_ff @(negedge clk or posedge rst)
	if(rst) Q = 8'h00;
	else
		if(en) Q = Q + num;

endmodule