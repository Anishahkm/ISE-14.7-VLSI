library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_not_gate is
    Port (
        A : in  STD_LOGIC_VECTOR(7 downto 0);
        Y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end eight_bit_not_gate;

architecture Structural of eight_bit_not_gate is

    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
	 
begin

    NOT0: nand_gate
        port map (A => A(0), B => A(0), Y => Y(0));

    NOT1: nand_gate
        port map (A => A(1), B => A(1), Y => Y(1));

    NOT2: nand_gate
        port map (A => A(2), B => A(2), Y => Y(2));

    NOT3: nand_gate
        port map (A => A(3), B => A(3), Y => Y(3));

    NOT4: nand_gate
        port map (A => A(4), B => A(4), Y => Y(4));

    NOT5: nand_gate
        port map (A => A(5), B => A(5), Y => Y(5));

    NOT6: nand_gate
        port map (A => A(6), B => A(6), Y => Y(6));

    NOT7: nand_gate
        port map (A => A(7), B => A(7), Y => Y(7));

end Structural;