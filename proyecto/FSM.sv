module FSM(input clk, rst, fin, igual, pFin, inicio, sel,
				output set_Iniciales, patron_no, patron_si, patron_fin, sumatexto, patron_cero, patron_texto_suma, text_suma,
				output [3:0] actual_state);
				
logic [3:0] state, next_state;

//actual state
always_ff @(posedge clk or posedge rst)
	if(rst) state = 4'd7;
	else
		state = next_state;
		
//next state

always_comb
	case(state)
	4'd0: next_state = 4'd1;
	4'd1: if(fin) next_state = 4'd7; else next_state = 4'd2;
	4'd2: if(igual) next_state = 4'd4; else next_state = 4'd8;
	4'd3: next_state = 4'd1;
	4'd4: if(pFin) next_state = 4'd6; else next_state = 4'd5;
	4'd5: next_state = 4'd1;
	4'd6: next_state = 4'd1;
	4'd7: if(inicio && sel) next_state = 4'd0; else next_state = 4'd7;
	4'd8: next_state = 4'd9;
	4'd9: if(igual) next_state = 4'd10; else next_state = 4'd11;
	4'd10: next_state = 4'd1;
	4'd11: next_state = 4'd1;
	default: next_state = 4'd0;
	endcase
	
//outputs

assign set_Iniciales = (state == 4'd0);
assign sumatexto = (state == 4'd3);
assign patron_no = (state == 4'd3);
assign patron_si = (state == 4'd5);
assign patron_fin = (state == 4'd6);
assign patron_cero = (state == 4'd8);
assign patron_texto_suma = (state == 4'd10);
assign text_suma = (state == 4'd11);
assign actual_state = state;

endmodule
