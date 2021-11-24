module FSMKMP(input clk, rst, finTexto, inicio, igual, finPatron, menor0, sel,
				  output set_Iniciales, sumaTextoPatron, rstPatron, sumaInstancia, posPorT, sumaTexto,
  				  output [3:0] actual_state);
				
logic [3:0] state, next_state;

//actual state
always_ff @(posedge clk or posedge rst)
	if(rst) state = 4'd2;
	else
		state = next_state;
		
//next state

always_comb
	case(state)
	4'd0: next_state = 4'd1;
	4'd1: if(finTexto) next_state = 4'd2; else next_state = 4'd3;
	4'd2: if(inicio && sel) next_state = 4'd0; else next_state = 4'd2;
	4'd3: if(igual) next_state = 4'd5; else next_state = 4'd7;
	4'd4: next_state = 4'd1;
	4'd5: if(finPatron) next_state = 4'd6; else next_state = 4'd4;
	4'd6: next_state = 4'd4;
	4'd7: if(menor0) next_state = 4'd9; else next_state = 4'd8;
	4'd8: next_state = 4'd1;
	4'd9: next_state = 4'd1;
	default: next_state = 4'd0;
	endcase
	
//outputs

assign set_Iniciales = (state == 4'd0);
assign sumaTextoPatron = (state == 4'd4);
assign rstPatron = (state == 4'd6);
assign sumaInstancia = (state == 4'd6);
assign posPorT = (state == 4'd8);
assign sumaTexto = (state == 4'd9);
assign actual_state = state;


endmodule
