module rom_tb();

logic [2:0]  address;
logic [7:0]  address2;
logic  clk, rst;
logic [7:0]  q;
logic [7:0]  q2;

rom mem(address, clk, q);
text_rom mem_text(address2, clk, q2);
Counter2 contador(clk, rst, 1'b1, address);
Counter2 contador2(clk, rst, 1'b1, address2);

endmodule 