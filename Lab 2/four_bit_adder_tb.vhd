library IEEE;
use IEEE.std_logic_1164.all;

entity four_bit_adder_tb is
end four_bit_adder_tb;

architecture behavior of four_bit_adder_tb is

	component four_bit_adder
    	port (
        	A_4bit: in std_logic_vector(3 downto 0);
            B_4bit: in std_logic_vector(3 downto 0);
            Cin_4bit: in std_logic;
            Z_4bit: out std_logic_vector(3 downto 0);
            Cout_4bit: out std_logic
        );
    end component;
    
    
    --Inputs
    signal A_4bit: std_logic_vector(3 downto 0) := "0000";
    signal B_4bit: std_logic_vector(3 downto 0) := "0000";
    signal Cin_4bit: std_logic := '0';
    
    --Outputs
    signal Z_4bit: std_logic_vector(3 downto 0) := "0000";
    signal Cout_4bit: std_logic := '0';
    
    
begin
    
    uut: four_bit_adder port map (
    	A_4bit => A_4bit,
        B_4bit => B_4bit,
        Cin_4bit => Cin_4bit,
        Z_4bit => Z_4bit,
        Cout_4bit => Cout_4bit
    );
    
    
    stim_proc: process
    begin
    	wait for 100 ns;
        A_4bit<="1010"; B_4bit<="0001"; Cin_4bit<='0';
        wait for 100 ns;
        A_4bit<="1011"; B_4bit<="0001"; Cin_4bit<='0';
        wait for 100 ns;
        A_4bit<="0010"; B_4bit<="0001"; Cin_4bit<='0';
        wait for 100 ns;
        A_4bit<="0001"; B_4bit<="0001"; Cin_4bit<='0';
        wait for 100 ns;
        A_4bit<="1010"; B_4bit<="0000"; Cin_4bit<='0';
        wait for 100 ns;
        
        
        wait;
    end process;
end;
    