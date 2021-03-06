module FuerzaBruta(input inicio, sel, clk, rst, input logic [7:0]sw_bit_inicial, output logic [7:0] instancias);

logic fin, igual, pFin;
logic set_Iniciales, patron_no, patron_si, patron_fin, sumatexto, patron_cero, patron_texto_suma, sumaralgo, text_suma;
	
logic [7:0]patron; 
logic [7:0]texto;
logic [3:0] actual_state;
	
						  
logic [2:0]  address_patron;
logic [13:0]  address_texto;
logic [7:0]  start;



FSM control(clk, rst, fin, igual, pFin, inicio, sel, set_Iniciales, patron_no, patron_si, patron_fin, sumatexto, patron_cero, patron_texto_suma, text_suma, sumaralgo,actual_state);

//suma sum(clk, rst, set_Iniciales, sw_bit_inicial, address_texto);

Comparator #(14)  finTexto(14'd11064, address_texto, fin);

Comparator letraIgual(patron, texto, igual);

Comparator #(3) finPatron(3'b100, address_patron, pFin);

Counter2 contador_instancias(clk, rst, patron_fin, instancias);

rom patron_mem(address_patron, clk, patron);
Counter2 contador_patron(clk, rst | patron_fin | patron_no | patron_cero, patron_si | patron_texto_suma, address_patron);

//text_rom mem_text(address_texto, clk, texto);
example exampleText(address_texto, clk, texto);
counterCopy #(14) contador_text(clk, rst, patron_si | patron_fin | patron_texto_suma | text_suma, sumaralgo, sw_bit_inicial, address_texto);

endmodule 