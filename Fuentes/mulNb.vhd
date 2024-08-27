library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity mulNb is
    generic(
        N : natural := 8
    );
    port(
        num1_mul   	: in    STD_LOGIC_VECTOR(N-1 downto 0);
        num2_mul   	: in    STD_LOGIC_VECTOR(N-1 downto 0);
		result_mul	: out   STD_LOGIC_VECTOR(2*N-1 downto 0)
    );
    end entity;

    architecture mulNb_arq of mulNb is
        signal aux_num1_mul : STD_LOGIC_VECTOR(2*N-1 downto 0);
    begin
        aux_num1_mul <= STD_LOGIC_VECTOR(unsigned(num1_mul) * unsigned(num2_mul));
        result_mul <= aux_num1_mul(2*N-1 downto 0);
    end architecture;