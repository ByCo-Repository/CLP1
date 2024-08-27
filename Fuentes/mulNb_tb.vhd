library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mulNb_tb is
end entity mulNb_tb;

architecture mulNb_tb_arq of mulNb_tb is
    constant N_tb : natural := 8; 
    signal num1_tb   : STD_LOGIC_VECTOR(N_tb-1 downto 0) := (others => '0');
    signal num2_tb   : STD_LOGIC_VECTOR(N_tb-1 downto 0) := (others => '0');
    signal result_tb : STD_LOGIC_VECTOR(2*N_tb-1 downto 0);


begin
    -- Asignaciones temporales a las señales
    num1_tb <= STD_LOGIC_VECTOR(to_unsigned(10, N_tb)) after 20 ns,STD_LOGIC_VECTOR(to_unsigned(2, N_tb)) after 40 ns, STD_LOGIC_VECTOR(to_unsigned(6, N_tb)) after 60 ns;
    num2_tb <= STD_LOGIC_VECTOR(to_unsigned(5, N_tb)) after 30 ns, STD_LOGIC_VECTOR(to_unsigned(7, N_tb)) after 50 ns, STD_LOGIC_VECTOR(to_unsigned(5, N_tb)) after 70 ns;

    -- Instanciación de la unidad bajo prueba (DUT)
    DUT: entity work.mulNb
        generic map(
            N => N_tb
        )
        port map (
            num1_mul    =>  num1_tb,
            num2_mul    =>  num2_tb,
            result_mul  =>  result_tb
        );

end architecture mulNb_tb_arq;
