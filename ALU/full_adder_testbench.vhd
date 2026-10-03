library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_testbench is
end full_adder_testbench;

architecture Behavioral of full_adder_testbench is

    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            SUM  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;
 signal A    : STD_LOGIC := '0';
    signal B    : STD_LOGIC := '0';
    signal Cin  : STD_LOGIC := '0';
    signal SUM  : STD_LOGIC;
    signal Cout : STD_LOGIC;

begin

    UUT: full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            SUM  => SUM,
            Cout => Cout
        );
	  A <= '0',
         '0' after 100 ns,
         '0' after 200 ns,
         '0' after 300 ns,
         '1' after 400 ns,
         '1' after 500 ns,
         '1' after 600 ns,
         '1' after 700 ns;
	  B <= '0',
         '0' after 100 ns,
         '1' after 200 ns,
         '1' after 300 ns,
         '0' after 400 ns,
         '0' after 500 ns,
         '1' after 600 ns,
         '1' after 700 ns;
		Cin <= '0',
           '1' after 100 ns,
           '0' after 200 ns,
           '1' after 300 ns,
           '0' after 400 ns,
           '1' after 500 ns,
           '0' after 600 ns,
           '1' after 700 ns;

end Behavioral;