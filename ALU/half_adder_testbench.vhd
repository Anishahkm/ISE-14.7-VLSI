library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_testbench is
end half_adder_testbench;

architecture Behavioral of half_adder_testbench is

    component half_adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            SUM   : out STD_LOGIC;
            CARRY : out STD_LOGIC
        );
    end component;

    signal A     : STD_LOGIC := '0';
    signal B     : STD_LOGIC := '0';
    signal SUM   : STD_LOGIC;
    signal CARRY : STD_LOGIC;
begin

    uut: half_adder
        port map (
            A     => A,
            B     => B,
            SUM   => SUM,
            CARRY => CARRY
        );

    -- Test 00
    A <= '0',
         '0' after 100 ns,
         '1' after 200 ns,
         '1' after 300 ns;

    B <= '0',
         '1' after 100 ns,
         '0' after 200 ns,
         '1' after 300 ns;

end Behavioral;