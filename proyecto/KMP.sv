module KMP(input logic inicio, sel, input logic [7:0]sw_bit_inicial, output logic [7:0] instancias);

logic clk, rst, finTexto, igual, finPatron, menor0;
logic set_Iniciales, sumaTextoPatron, rstPatron, sumaInstancia, posPorT, sumaTexto;
logic [3:0] actual_state;		  
						  
logic [2:0]  address_patron;
logic [7:0]  address_texto;
logic [7:0]  patron;
logic [7:0]  texto;


FSMKMP fsm(clk, rst, finTexto, inicio, igual, finPatron, menor0, sel, set_Iniciales, sumaTextoPatron, rstPatron, sumaInstancia, posPorT, sumaTexto, actual_state, sel);


Comparator FinTexto(7'd55, address_texto, finTexto);

Comparator letraIgual(patron, texto, igual);

Comparator #(3) FinPatron(3'b100, address_patron, finPatron);

Counter2 contador_instancias(clk, rst | set_Iniciales, sumaInstancia, instancias);

Comparator #(3) menor(3'd0, address_patron, menor0);

rom patron_mem(address_patron, clk, patron);
Counter2 contador_patron(clk, rst | set_Iniciales | rstPatron | posPorT, sumaTextoPatron, address_patron);

text_rom mem_text(address_texto, clk, texto);
Counter2 contador_text(clk, rst | set_Iniciales, sumaTextoPatron | sumaTexto, address_texto);

endmodule 