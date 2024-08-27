library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MULTIPLEXOR_tb is
end entity;

architecture behavior of MULTIPLEXOR_tb is

    -- Component declaration of the MULTIPLEXOR
    component MULTIPLEXOR
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
            m_Cin         : in  STD_LOGIC_VECTOR (0 downto 0);
            m_sel         : in  STD_LOGIC_VECTOR (S-1 downto 0)
        );
    end component;

    -- Signals for the inputs and outputs
    signal m_num1_tb, m_num2_tb : STD_LOGIC_VECTOR (7 downto 0);
    signal m_result_tb : STD_LOGIC_VECTOR (7 downto 0);
    signal m_result_mul_tb : STD_LOGIC_VECTOR (15 downto 0);  -- Ajustado para 2*N bits
    signal m_quotient_tb : STD_LOGIC_VECTOR (7 downto 0);
    signal m_Cout_tb, m_Cin_tb : STD_LOGIC_VECTOR (0 downto 0);
    signal m_sel_tb : STD_LOGIC_VECTOR (1 downto 0);

begin

    -- Instantiate the MULTIPLEXOR
    uut: MULTIPLEXOR
        generic map(
            N => 8,
            S => 2
        )
        port map(
            m_num1       => m_num1_tb,
            m_num2       => m_num2_tb,
            m_result     => m_result_tb,
            m_result_mul => m_result_mul_tb,
            m_quotient   => m_quotient_tb,
            m_Cout       => m_Cout_tb,
            m_Cin        => m_Cin_tb,
            m_sel        => m_sel_tb
        );

    -- Test process
    stimulus: process
    begin
        -- Test case 1: Addition
        m_num1_tb <= "00000111"; -- 
        m_num2_tb <= "00000101"; --
        m_Cin_tb <= "0";
        m_sel_tb <= "00"; -- Select addition
        wait for 10 ns;
        
        -- Test case 2: Subtraction
        m_num1_tb <= "00001000"; -- 
        m_num2_tb <= "00010011"; -- 
        m_sel_tb <= "01"; -- Select subtraction
        wait for 10 ns;

        -- Test case 3: Division
        m_num1_tb <= "00001000"; -- 8
        m_num2_tb <= "00000010"; -- 2
        m_sel_tb <= "10"; -- Select division
        wait for 10 ns;

        -- Test case 4: Multiplication
        m_num1_tb <= "00000010"; -- 2
        m_num2_tb <= "00000011"; -- 3
        m_sel_tb <= "11"; -- Select multiplication
        wait for 10 ns;
        
        -- Wait for the last operation to complete
        wait;
    end process;
end architecture;
