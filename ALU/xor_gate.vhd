library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end xor_gate;

architecture Behavioral of xor_gate is

    signal X, N1, N2 : STD_LOGIC;
begin

    -- NAND 1
    X <= A NAND B;

    -- NAND 2
    N1 <= A NAND X;

    -- NAND 3
    N2 <= B NAND X;

    -- NAND 4
    Y <= N1 NAND N2;

end Behavioral;