library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_flip_flop_testbench is
end nand_flip_flop_testbench;

architecture Behavioral of nand_flip_flop_testbench is

    component nand_flip_flop
        Port (
            S  : in  STD_LOGIC;
            R  : in  STD_LOGIC;
            Q  : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal S  : STD_LOGIC := '1';
    signal R  : STD_LOGIC := '1';
    signal Q  : STD_LOGIC;
    signal Qn : STD_LOGIC;
begin

    uut: nand_flip_flop
        port map (
            S  => S,
            R  => R,
            Q  => Q,
            Qn => Qn
        );

    -- HOLD
    S <= '1',
         '0' after 100 ns,
         '1' after 200 ns,
         '1' after 300 ns;

    R <= '1',
         '1' after 100 ns,
         '0' after 200 ns,
         '1' after 300 ns;

end Behavioral;