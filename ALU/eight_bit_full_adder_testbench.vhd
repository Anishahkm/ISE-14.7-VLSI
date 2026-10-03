library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_full_adder_testbench is
end eight_bit_full_adder_testbench;

architecture Behavioral of eight_bit_full_adder_testbench is

    component eight_bit_full_adder
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            Cin  : in  STD_LOGIC;
            SUM  : out STD_LOGIC_VECTOR(7 downto 0);
            Cout : out STD_LOGIC
        );
    end component;
	     signal A    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal B    : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal Cin  : STD_LOGIC := '0';
    signal SUM  : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout : STD_LOGIC;

begin

    UUT: eight_bit_full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            SUM  => SUM,
            Cout => Cout
        );
		     A <= "00000000",
         "00001111" after 100 ns,
         "10101010" after 200 ns,
         "11111111" after 300 ns,
         "01010101" after 400 ns;

    B <= "00000000",
         "00000001" after 100 ns,
         "01010101" after 200 ns,
         "00000001" after 300 ns,
         "10101010" after 400 ns;
     Cin <= '0',
           '0' after 100 ns,
           '0' after 200 ns,
           '0' after 300 ns,
           '1' after 400 ns;

end Behavioral;