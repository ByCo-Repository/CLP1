library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity MULTIPLEXOR_VIO is
    port(
        clk_i: in std_logic
    );
end;


architecture multiplexor_arq of multiplexor_VIO is
signal probe_num1, probe_num2, probe_result, probe_quotient: STD_LOGIC_VECTOR (7 downto 0);
signal probe_result_mul: STD_LOGIC_VECTOR(15 downto 0);
signal probe_Cout, probe_Cin: STD_LOGIC_VECTOR(0 downto 0);
signal probe_sel: STD_LOGIC_VECTOR(1 downto 0);

COMPONENT vio_0
  PORT (
    clk : IN STD_LOGIC;
    probe_in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_in1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_in2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe_in3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe_out0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe_out2 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe_out3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

begin
    MULTIPLEXOR_INST: entity work.MULTIPLEXOR
        port map (
    
                m_num1        => probe_num1,
                m_num2        => probe_num2,
                m_result      => probe_result,
                m_result_mul  => probe_result_mul,
                m_quotient    => probe_quotient,
                m_Cout        => probe_Cout,
                m_Cin         => probe_cin,
                m_sel         => probe_sel
            
        );
        
        
       multiplexor_vio : vio_0
          PORT MAP (
            clk => clk_i,
            probe_in0 => probe_result,
            probe_in1 => probe_quotient,
            probe_in2 => probe_result_mul,
            probe_in3 => probe_Cout,
            probe_out0 => probe_num1,
            probe_out1 => probe_num2,
            probe_out2 => probe_sel,
            probe_out3 => probe_Cin
          );

end architecture;