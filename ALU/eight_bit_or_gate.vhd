library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_or_gate is
    Port (
        A : in  STD_LOGIC_VECTOR(7 downto 0);
        B : in  STD_LOGIC_VECTOR(7 downto 0);
        Y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end eight_bit_or_gate;

architecture Structural of eight_bit_or_gate is

    component or_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
	 
begin

    OR0: or_gate
        port map (A => A(0), B => B(0), Y => Y(0));

    OR1: or_gate
        port map (A => A(1), B => B(1), Y => Y(1));

    OR2: or_gate
        port map (A => A(2), B => B(2), Y => Y(2));

    OR3: or_gate
        port map (A => A(3), B => B(3), Y => Y(3));

    OR4: or_gate
        port map (A => A(4), B => B(4), Y => Y(4));

    OR5: or_gate
        port map (A => A(5), B => B(5), Y => Y(5));

    OR6: or_gate
        port map (A => A(6), B => B(6), Y => Y(6));

    OR7: or_gate
        port map (A => A(7), B => B(7), Y => Y(7));

end Structural;