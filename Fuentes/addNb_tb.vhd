library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addNb_tb is
end entity addNb_tb;

architecture addNb_tb_arq of addNb_tb is
    constant N_tb : natural := 8; 
    signal num1_tb   : STD_LOGIC_VECTOR(N_tb-1 downto 0) := (others => '0');
    signal num2_tb   : STD_LOGIC_VECTOR(N_tb-1 downto 0) := (others => '0');
    signal Cin_tb    : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');  
    signal result_tb : STD_LOGIC_VECTOR(N_tb-1 downto 0);
    signal Cout_tb   : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');

begin
    -- Asignaciones temporales a las señales
    num1_tb <= STD_LOGIC_VECTOR(to_unsigned(10, N_tb)) after 20 ns,STD_LOGIC_VECTOR(to_unsigned(100, N_tb)) after 40 ns, STD_LOGIC_VECTOR(to_unsigned(25, N_tb)) after 60 ns;
    Cin_tb <= STD_LOGIC_VECTOR(to_unsigned(1, 1)) after 30 ns, STD_LOGIC_VECTOR(to_unsigned(0, 1)) after 50 ns, STD_LOGIC_VECTOR(to_unsigned(0, 1)) after 70 ns;
    num2_tb <= STD_LOGIC_VECTOR(to_unsigned(57, N_tb)) after 30 ns, STD_LOGIC_VECTOR(to_unsigned(157, N_tb)) after 50 ns, STD_LOGIC_VECTOR(to_unsigned(85, N_tb)) after 70 ns;

    -- Instanciación de la unidad bajo prueba (DUT)
    DUT: entity work.addNb
        generic map(
            N => N_tb
        )
        port map (
            num1_add    => num1_tb,
            num2_add    => num2_tb,
            Cin_add     => Cin_tb,
            result_add  => result_tb,
            Cout_add    => Cout_tb
        );

end architecture addNb_tb_arq;
