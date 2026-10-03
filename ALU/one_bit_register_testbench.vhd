library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_bit_register_testbench is
end one_bit_register_testbench;

architecture Behavioral of one_bit_register_testbench is

    component one_bit_register
        Port (
            D      : in  STD_LOGIC;
            Enable : in  STD_LOGIC;
            Q      : out STD_LOGIC
        );
    end component;

    signal D      : STD_LOGIC := '0';
    signal Enable : STD_LOGIC := '0';
    signal Q      : STD_LOGIC;
begin

    uut: one_bit_register
        port map (
            D      => D,
            Enable => Enable,
            Q      => Q
        );

    -- Initially: Enable = 0, Q should hold
    D <= '0',
         '1' after 100 ns,
         '0' after 200 ns,
         '1' after 300 ns,
         '0' after 400 ns;

    Enable <= '0',
               '1' after 100 ns,
               '0' after 200 ns,
               '1' after 300 ns,
               '0' after 400 ns;

end Behavioral;