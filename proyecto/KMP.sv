module KMP(input logic inicio, sel, clk, rst, input logic [7:0]sw_bit_inicial,output logic [7:0] instancias);

logic fin, igual, finPatron, menor0;
logic set_Iniciales, sumaTextoPatron, rstPatron, sumaInstancia, posPorT, sumaTexto;
 
logic [7:0]patron; 
logic [7:0]texto;
logic [3:0] actual_state;

logic sumaalgo;

						  
logic [2:0]  address_patron;
logic [13:0]  address_texto;



FSMKMP fsm(clk, rst, fin, inicio, igual, finPatron, menor0, sel, set_Iniciales, sumaTextoPatron, rstPatron, sumaInstancia, posPorT, sumaTexto,sumaalgo,actual_state);


Comparator #(14)  finTexto(14'd11064, address_texto, fin);

Comparator letraIgual(patron, texto, igual);

Comparator #(3) FinPatron(3'b100, address_patron, finPatron);

Counter2 contador_instancias(clk, rst | set_Iniciales, sumaInstancia, instancias);

Comparator #(3) menor(3'd0, address_patron, menor0);

rom patron_mem(address_patron, clk, patron);
Counter2 contador_patron(clk, rst | set_Iniciales | rstPatron | posPorT, sumaTextoPatron, address_patron);

//text_rom mem_text(address_texto, clk, texto);
example exampleText(address_texto, clk, texto);

//modifif
counterCopy #(14) contador_text(clk, rst | set_Iniciales, sumaTextoPatron | sumaTexto, sumaalgo, sw_bit_inicial, address_texto);
endmodule 