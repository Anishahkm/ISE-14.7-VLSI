library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_bit_register is
    Port (
        D      : in  STD_LOGIC;
        Enable : in  STD_LOGIC;
        Q      : out STD_LOGIC
    );
end one_bit_register;

architecture Structural of one_bit_register is

    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
 component nand_flip_flop
        Port (
            S  : in  STD_LOGIC;
            R  : in  STD_LOGIC;
            Q  : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal Dn : STD_LOGIC;
    signal S  : STD_LOGIC;
    signal R  : STD_LOGIC;
    signal Qn : STD_LOGIC;

begin

    -- Generate NOT D using NAND
    NAND_NOT: nand_gate
        port map (
            A => D,
            B => D,
            Y => Dn
        );
    -- Active-low Set
    NAND_SET: nand_gate
        port map (
            A => D,
            B => Enable,
            Y => S
        );

    -- Active-low Reset
    NAND_RESET: nand_gate
        port map (
            A => Dn,
            B => Enable,
            Y => R
        );

    -- NAND-based storage element
    STORAGE: nand_flip_flop
        port map (
            S  => S,
            R  => R,
            Q  => Q,
            Qn => Qn
        );

end Structural;