/* ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 010  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 011  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 100  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 101  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 110  |   ALU_Out = A xor B;
----------------------------------------------------------------------*/

//flags:
//N,Z,C,V


module ALU #( parameter BITS=4)( input logic [2:0]ALU_Code,

	input logic [BITS-1:0]A,
	input logic [BITS-1:0]B,
	
	output logic [BITS-1:0]ALU_Result,

	//
	output logic [3:0]flags,
	output logic [6:0]display
	
	);
	
	//addition and substraction
	reg[3:0] tmp_adder;
	reg[3:0] tmp_substractor;
	
	
	//to display
	//reg [6:0]    r_Hex_Encoding = 7'h00;

	
	N_bit_adder sumador(A,B,tmp_adder,carry_adder);
	N_bit_substractor restador(A,B,tmp_substractor,carry_substractor);
	
		
	always @(*)
    begin
	 	  flags = 4'b0000;
		  
        case(ALU_Code)
        3'b000: // Addition
			  //N_bit_adder sumador(A,B,ALU_Result);
			  //ALU_Result = A + B ;
			  begin
			  //ALU_Result = A + B ;
           ALU_Result = tmp_adder;
			  flags[0]=carry_adder;
			  flags[1]=carry_adder;

			  end
        3'b001: // Subtraction
			  //N_bit_substractor restador(A,B,ALU_Result);
			  //ALU_Result = A - B ;
			  begin
           ALU_Result = tmp_adder;
			  flags[0]=carry_substractor;
			  flags[1]=carry_substractor;
			  if(A<B)
				flags[3]=1;	
			  end
        3'b010: // Logical shift left
           ALU_Result = A<<1;
        3'b011: // Logical shift right
           ALU_Result = A>>1;
        3'b100: //  Logical and 
           ALU_Result = A & B;
        3'b101: //  Logical or
           ALU_Result = A | B;
        3'b110: //  Logical xor 
           ALU_Result = A ^ B;
		  3'b111: //  prueba
           ALU_Result = 4'b1111;
			  
		  default: ALU_Result = A | B;
        endcase
		  
		  //translate 4 bits to 7 segments display
		  
		  case (ALU_Result)
			4'b0000 :      	//Hexadecimal 0
			display = 7'b1000000;
			4'b0001 :    		//Hexadecimal 1
			display = 7'b1111001  ;
			4'b0010 :  		// Hexadecimal 2
			display = 7'b0100100 ; 
			4'b0011 : 		// Hexadecimal 3
			display = 7'b0110000 ;
			4'b0100 :		// Hexadecimal 4
			display = 7'b0011001;
			4'b0101 :		// Hexadecimal 5
			display = 7'b0010010 ;  
			4'b0110 :		// Hexadecimal 6
			display = 7'b0000010;
			4'b0111 :		// Hexadecimal 7
			display = 7'b1111000;
			4'b1000 :     		 //Hexadecimal 8
			display = 7'b0000000;
			4'b1001 :    		//Hexadecimal 9
			display = 7'b0010000;
			4'b1010 :  		// Hexadecimal A
			display = 7'b0001000; 
			4'b1011 : 		// Hexadecimal B
			display = 7'b0000011;
			4'b1100 :		// Hexadecimal C
			display = 7'b1000110;
			4'b1101 :		// Hexadecimal D
			display = 7'b0100001;
			4'b1110 :		// Hexadecimal E
			display = 7'b0000110;
			4'b1111 :		// Hexadecimal F
			display = 7'b0001110;
			endcase
			
						
		if(ALU_Result == 4'b0000)
			flags[2]=1;

    end 

endmodule