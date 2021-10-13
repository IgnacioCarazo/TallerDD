module Comparator #(parameter N = 4)(A,B,equal);
	input logic [N-1:0]A;
	input logic [N-1:0]B;
	output logic equal;
	
	always @(*) begin
		if (B <= A) equal=1'b1;
		else equal=1'b0;
	end
	 		
	//assign equal = (A >= B);

endmodule


/*
module Comparator #(parameter N = 4)(input logic [N-1:0]A,B, output logic equal);

	if (A == B) equal=1'b1;
	else equal=1'b0;
									
endmodule



/*
module Comparator #(parameter N = 4)(input logic	[N-1:0]A,B, output logic equal);
	if (A == B)
			equal=1'b1;
	else
			equal=1'b0;

endmodule 


/*
	begin
	if (A == B)
			equal=1'b1;
	else
			equal=1'b0;
	end
		
//assign equal = (A >= B);

endmodule*/