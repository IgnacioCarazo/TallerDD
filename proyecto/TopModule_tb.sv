`timescale 1 ps / 1 ps
module TopModule_tb();

    logic btn_inicio, sw_sel, clk, rst;
    logic [7:0] sw_bit_inicial;
    logic [6:0] display_instancias;


    TopModule topmodule(btn_inicio, sw_sel, clk, rst, sw_bit_inicial, display_instancias);

    initial begin

    sw_sel = 1;

    #50;

    btn_inicio = 1;

    #50;

    #10000;


    end


endmodule