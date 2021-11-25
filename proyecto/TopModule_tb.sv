`timescale 1 ps / 1 ps
module TopModule_tb();

    logic btn_inicio, sw_sel, clk, rst;
    logic [7:0] sw_bit_inicial;
    logic [7:0] display_FB,display_KMP,patron_FB,texto_FB,patron_KMP,texto_KMP;
	 logic [3:0] actual_state_FB, actual_state_KMP;


    TopModule topmodule(btn_inicio, sw_sel, clk, rst, sw_bit_inicial, display_FB,display_KMP,patron_FB,texto_FB,patron_KMP,texto_KMP, actual_state_FB, actual_state_KMP);
	 
	 always begin
		
		#10 clk = ~clk;
    end

    initial begin
	 clk = 0;
	 rst = 1;
	 
	 #300
	 
	 rst = 0;

	 
    sw_sel = 1;

    #100;
	 
	 btn_inicio = 1;
	 
	 #100;



    end


endmodule