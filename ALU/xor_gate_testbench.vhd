library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate_testbench is
end xor_gate_testbench;

architecture Behavioral of xor_gate_testbench is

    component xor_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;
begin

    uut: xor_gate
        port map (
            A => A,
            B => B,
            Y => Y
        );

    -- Test inputs
    A <= '0',
         '0' after 100 ns,
         '1' after 200 ns,
         '1' after 300 ns;

    B <= '0',
         '1' after 100 ns,
         '0' after 200 ns,
         '1' after 300 ns;

end Behavioral;