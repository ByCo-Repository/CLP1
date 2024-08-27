library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity MULTIPLEXOR is
    generic(
        N : natural := 8;
        S : natural := 2
    );
    port(
        m_num1        : in  STD_LOGIC_VECTOR (N-1 downto 0);
        m_num2        : in  STD_LOGIC_VECTOR (N-1 downto 0);
        m_result      : out STD_LOGIC_VECTOR (N-1 downto 0);
        m_result_mul  : out STD_LOGIC_VECTOR (2*N-1 downto 0);
        m_quotient    : out STD_LOGIC_VECTOR (N-1 downto 0);
        m_Cout        : out STD_LOGIC_VECTOR (0 downto 0);
        m_Cin         : in STD_LOGIC_VECTOR (0 downto 0);
        m_sel         : in  STD_LOGIC_VECTOR (S-1 downto 0)
    );
end;

architecture MULTIPLEXOR_arq of MULTIPLEXOR is
    signal s_add_res, s_sub_res, s_div_res, s_quotiente_res : STD_LOGIC_VECTOR (N-1 downto 0);
    signal s_mul_res : STD_LOGIC_VECTOR (2*N-1 downto 0);
    signal s_Cout_add, s_Cout_sub: STD_LOGIC_VECTOR(0 downto 0);
begin
    ADD_INST: entity work.addNb
    port map (
        num1_add   => m_num1,
        num2_add   => m_num2,
		result_add => s_add_res,
        Cout_add   => s_Cout_add,
        Cin_add    => m_Cin
    );

    SUB_INST: entity work.subNb
    port map (
        num1_sub    => m_num1,
        num2_sub    => m_num2,
		result_sub  => s_sub_res,
        Bout        => s_Cout_sub,
        Bin         => m_Cin
    );

    MUL_INST: entity work.mulNb
    port map (
        num1_mul    => m_num1,	
        num2_mul   	=> m_num2,
		result_mul  => s_mul_res
    );

    DIV_INST: entity work.divNb
    port map (
        num1_div   => m_num1,
        num2_div   => m_num2,
        quotient   => s_div_res,
        remainder  => s_quotiente_res
        
    );

     process (m_sel, s_add_res, s_sub_res, s_div_res, s_mul_res, s_quotiente_res)

    begin 
        case to_integer(unsigned(m_sel)) is
            when 0 => 
            m_result <= s_add_res;
            m_Cout <= s_Cout_add;
            m_result_mul <= (others => '0');
            
            when 1 =>
            m_result <= s_sub_res;
            m_result_mul <= (others => '0');
            m_Cout <= s_Cout_sub;

            when 2 =>
            m_result <= s_div_res;
            m_quotient <= s_quotiente_res;
            m_result_mul <= (others => '0');

            when 3 =>
            m_result_mul <= s_mul_res;
            m_quotient <= (others => '0');
            m_result <= (others => '0');
            m_Cout <= (others => '0');

            when others =>
            m_result <= (others => '0');
            m_Cout <= (others => '0');
            m_result_mul <= (others => '0');
            m_quotient <= (others => '0');
        end case;
    end process;
    
end architecture;