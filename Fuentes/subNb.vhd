library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity subNb is
    generic(
        N : natural := 8
    );
    port(
        num1_sub   	: in    STD_LOGIC_VECTOR(N-1 downto 0);
        num2_sub   	: in    STD_LOGIC_VECTOR(N-1 downto 0);
		Bin 	: in    STD_LOGIC_VECTOR(0 downto 0) ;
		result_sub	: out   STD_LOGIC_VECTOR(N-1 downto 0);
        Bout   	: out   STD_LOGIC_VECTOR(0 downto 0)
    );
end entity subNb;

architecture subNb_arq of subNb is
	signal u_num1_sub : STD_LOGIC_VECTOR(N downto 0);
		begin
			u_num1_sub <= STD_LOGIC_VECTOR(unsigned('0'&num1_sub) - unsigned('0'&num2_sub) - unsigned(Bin));
			Bout <= u_num1_sub(N downto N);
			result_sub <= u_num1_sub(N-1  downto 0);
end architecture;