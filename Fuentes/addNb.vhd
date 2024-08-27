library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity addNb is
    generic(
        N : natural := 8
    );
    port(
        num1_add   	: in    STD_LOGIC_VECTOR(N-1 downto 0);
        num2_add   	: in    STD_LOGIC_VECTOR(N-1 downto 0);
		Cin_add 	: in    STD_LOGIC_VECTOR(0 downto 0) ;
		result_add	: out   STD_LOGIC_VECTOR(N-1 downto 0);
        Cout_add   	: out   STD_LOGIC_VECTOR(0 downto 0)
    );
end entity addNb;

architecture addNb_arq of addNb is
	signal u_num1_add : STD_LOGIC_VECTOR(N+1 downto 0);
		begin
			u_num1_add <= STD_LOGIC_VECTOR(unsigned('0'&num1_add&Cin_add) + unsigned('0'&num2_add&'1'));
			Cout_add <= u_num1_add(N+1 downto N+1);
			result_add <= u_num1_add(N downto 1);
end architecture;
