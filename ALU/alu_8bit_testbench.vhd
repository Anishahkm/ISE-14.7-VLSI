library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit_testbench is
end alu_8bit_testbench;

architecture Behavioral of alu_8bit_testbench is

    component alu_8bit
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            Cin    : in  STD_LOGIC;
            OpSel  : in  STD_LOGIC_VECTOR(2 downto 0);
            Result : out STD_LOGIC_VECTOR(7 downto 0);
            Cout   : out STD_LOGIC
        );
    end component;
	 
    signal A      : STD_LOGIC_VECTOR(7 downto 0) := "00001111";
    signal B      : STD_LOGIC_VECTOR(7 downto 0) := "00000001";
    signal Cin    : STD_LOGIC := '0';
    signal OpSel  : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Result : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout   : STD_LOGIC;

begin

    UUT: alu_8bit
        port map (
            A      => A,
            B      => B,
            Cin    => Cin,
            OpSel  => OpSel,
            Result => Result,
            Cout   => Cout
        );

    -- Test different ALU operations

    OpSel <= "000",
             "001" after 100 ns,
             "010" after 200 ns,
             "011" after 300 ns,
             "100" after 400 ns,
             "101" after 500 ns;

    -- Cin = 0 for A+B
    -- Cin = 1 for A+B+Cin

    Cin <= '0',
           '1' after 100 ns;

end Behavioral;