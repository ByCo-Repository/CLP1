library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divNb_tb is
end entity divNb_tb;

architecture divNb_tb_arq of divNb_tb is
    constant N_tb       : natural := 8; 
    signal num1_tb      : STD_LOGIC_VECTOR(N_tb-1 downto 0) := (others => '0');
    signal num2_tb      : STD_LOGIC_VECTOR(N_tb-1 downto 0) := (others => '0');
    signal quotient_tb  :  STD_LOGIC_VECTOR(N_tb-1 downto 0);
    signal remainder_tb :  STD_LOGIC_VECTOR(N_tb-1 downto 0);


begin
    -- Asignaciones temporales a las señales
    num1_tb <= STD_LOGIC_VECTOR(to_unsigned(50, N_tb)) after 20 ns,STD_LOGIC_VECTOR(to_unsigned(20, N_tb)) after 40 ns, STD_LOGIC_VECTOR(to_unsigned(65, N_tb)) after 60 ns;
    num2_tb <= STD_LOGIC_VECTOR(to_unsigned(5, N_tb)) after 30 ns, STD_LOGIC_VECTOR(to_unsigned(7, N_tb)) after 50 ns, STD_LOGIC_VECTOR(to_unsigned(4, N_tb)) after 70 ns;

    -- Instanciación de la unidad bajo prueba (DUT)
    DUT: entity work.divNb
        generic map(
            N => N_tb
        )
        port map (
            num1_div => num1_tb,
            num2_div =>  num2_tb,
            quotient => quotient_tb,
            remainder => remainder_tb
        );

end architecture divNb_tb_arq;
