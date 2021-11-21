
// Modelsim-ASE requires a timescale directive
`timescale 1 ps / 1 ps

module FuerzaBruta_tb();

logic clk, rst;

FuerzaBruta algo1();

always begin
	#10 clk = ~clk;
end

initial begin

	clk = 0;
	rst = 1;
	
	#10
	rst = 0;

end

endmodule 