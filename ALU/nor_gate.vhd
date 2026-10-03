library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end nor_gate;

architecture Structural of nor_gate is

    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal N1 : STD_LOGIC;
    signal N2 : STD_LOGIC;
    signal N3 : STD_LOGIC;
begin

    NAND1: nand_gate
        port map (
            A => A,
            B => A,
            Y => N1
        );

    NAND2: nand_gate
        port map (
            A => B,
            B => B,
            Y => N2
        );

    NAND3: nand_gate
        port map (
            A => N1,
            B => N2,
            Y => N3
        );

    NAND4: nand_gate
        port map (
            A => N3,
            B => N3,
            Y => Y
        );

end Structural;
