library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_flip_flop is
    Port (
        S  : in  STD_LOGIC;
        R  : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end nand_flip_flop;

architecture Structural of nand_flip_flop is

    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal X1 : STD_LOGIC;
    signal X2 : STD_LOGIC;

begin
 -- First NAND gate
    NAND1: nand_gate
        port map (
            A => S,
            B => X2,
            Y => X1
        );

    -- Second NAND gate
    NAND2: nand_gate
        port map (
            A => R,
            B => X1,
            Y => X2
        );

    Q  <= X1;
    Qn <= X2;

end Structural;