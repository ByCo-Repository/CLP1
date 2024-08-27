library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity divNb is
    generic(
        N : natural := 8
    );
    port(
        num1_div    : in  STD_LOGIC_VECTOR(N-1 downto 0);
        num2_div    : in  STD_LOGIC_VECTOR(N-1 downto 0);
        quotient: out STD_LOGIC_VECTOR(N-1 downto 0);
        remainder: out STD_LOGIC_VECTOR(N-1 downto 0)
    );
end entity divNb;

architecture rtl of divNb is
begin
    process(num1_div, num2_div)
    variable u_num1_div : unsigned(N-1 downto 0);
    variable u_num2_div : unsigned(N-1 downto 0);
    variable u_quotient : unsigned(N-1 downto 0);
    variable u_remainder : unsigned(N-1 downto 0);
    begin
        u_num1_div := unsigned(num1_div); 
        u_num2_div := unsigned(num2_div);

        if u_num2_div /= 0 then
            u_quotient := u_num1_div / u_num2_div; 
            u_remainder := u_num1_div mod u_num2_div; 
        else
            u_quotient := (others => '0'); 
            u_remainder := u_num1_div; 
        end if;

        quotient <= std_logic_vector(u_quotient);
        remainder <= std_logic_vector(u_remainder);
    end process;
end architecture;