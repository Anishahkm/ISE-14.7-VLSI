library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_unit_testbench is
end logic_unit_testbench;

architecture Behavioral of logic_unit_testbench is

    component logic_unit
        Port (
            A   : in  STD_LOGIC_VECTOR(7 downto 0);
            B   : in  STD_LOGIC_VECTOR(7 downto 0);
            Sel : in  STD_LOGIC_VECTOR(1 downto 0);
            Y   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
	 
    signal A   : STD_LOGIC_VECTOR(7 downto 0) := "10101010";
    signal B   : STD_LOGIC_VECTOR(7 downto 0) := "11001100";
    signal Sel : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Y   : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT: logic_unit
        port map (
            A   => A,
            B   => B,
            Sel => Sel,
            Y   => Y
        );

    Sel <= "00",
           "01" after 100 ns,
           "10" after 200 ns,
           "11" after 300 ns;

end Behavioral;