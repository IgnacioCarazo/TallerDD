module Counter #(parameter N = 8) (input clk, rst, en,
												input [N-1:0] suma, 
												output logic [N-1:0] Q);
												

always_ff @(negedge clk or posedge rst)
	if(rst) Q = 8'h00;
	else
		if(en) Q = suma + 1'b1;

endmodule
