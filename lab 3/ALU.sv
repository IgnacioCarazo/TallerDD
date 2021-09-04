/* ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0100  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 0101  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------*/



module ALU #( parameter BITS=8)( input logic [3:0]ALU_Code,

	input logic [BITS-1:0]A,
	input logic [BITS-1:0]B,
	
	output logic [BITS-1:0]ALU_Result,
	output logic [BITS-1:0]tmp_adder,
	output logic [BITS-1:0]tmp_substractor,
	output logic [3:0]flags
	);
	
	
	N_bit_adder sumador(A,B,tmp_adder);
	N_bit_substractor restador(A,B,tmp_substractor);
	
	always @(*)
    begin
        case(ALU_Code)
        4'b0000: // Addition
			  //N_bit_adder sumador(A,B,ALU_Result);
			  //ALU_Result = A + B ;
           ALU_Result = tmp_adder ; 
        4'b0001: // Subtraction
			  //N_bit_substractor restador(A,B,ALU_Result);
			  //ALU_Result = A - B ;
           ALU_Result = tmp_substractor ;
        4'b0100: // Logical shift left
           ALU_Result = A<<1;
        4'b0101: // Logical shift right
           ALU_Result = A>>1;
        4'b1000: //  Logical and 
           ALU_Result = A & B;
        4'b1001: //  Logical or
           ALU_Result = A | B;
        4'b1010: //  Logical xor 
           ALU_Result = A ^ B;
        endcase
	 end
	

endmodule