library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity subNb_tb is
end entity subNb_tb;

architecture subNb_tb_arq of subNb_tb is
    constant N_tb : natural := 8; 
    signal num1_tb   : STD_LOGIC_VECTOR(N_tb-1 downto 0) := (others => '0');
    signal num2_tb   : STD_LOGIC_VECTOR(N_tb-1 downto 0) := (others => '0');
    signal Bin_tb    : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');  
    signal result_tb : STD_LOGIC_VECTOR(N_tb-1 downto 0);
    signal Bout_tb   : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');

begin
    -- Asignaciones temporales a las señales
    num1_tb <= STD_LOGIC_VECTOR(to_unsigned(10, N_tb)) after 20 ns,STD_LOGIC_VECTOR(to_unsigned(20, N_tb)) after 40 ns, STD_LOGIC_VECTOR(to_unsigned(25, N_tb)) after 60 ns;
    Bin_tb <= STD_LOGIC_VECTOR(to_unsigned(1, 1)) after 30 ns, STD_LOGIC_VECTOR(to_unsigned(0, 1)) after 50 ns, STD_LOGIC_VECTOR(to_unsigned(0, 1)) after 70 ns;
    num2_tb <= STD_LOGIC_VECTOR(to_unsigned(5, N_tb)) after 30 ns, STD_LOGIC_VECTOR(to_unsigned(17, N_tb)) after 50 ns, STD_LOGIC_VECTOR(to_unsigned(15, N_tb)) after 70 ns;

    -- Instanciación de la unidad bajo prueba (DUT)
    DUT: entity work.subNb
        generic map(
            N => N_tb
        )
        port map (
            num1_sub => num1_tb,
            num2_sub  => num2_tb,
            Bin    => Bin_tb,
            result_sub  => result_tb,
            Bout   => Bout_tb
        );

end architecture subNb_tb_arq;
