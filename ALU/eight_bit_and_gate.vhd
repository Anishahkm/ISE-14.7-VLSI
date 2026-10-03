library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_and_gate is
    Port (
        A : in  STD_LOGIC_VECTOR(7 downto 0);
        B : in  STD_LOGIC_VECTOR(7 downto 0);
        Y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end eight_bit_and_gate;

architecture Structural of eight_bit_and_gate is
    component and_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

begin

    AND0: and_gate
        port map (A => A(0), B => B(0), Y => Y(0));
		      AND1: and_gate
        port map (A => A(1), B => B(1), Y => Y(1));

    AND2: and_gate
        port map (A => A(2), B => B(2), Y => Y(2));

    AND3: and_gate
        port map (A => A(3), B => B(3), Y => Y(3));

    AND4: and_gate
        port map (A => A(4), B => B(4), Y => Y(4));
		      AND5: and_gate
        port map (A => A(5), B => B(5), Y => Y(5));

    AND6: and_gate
        port map (A => A(6), B => B(6), Y => Y(6));

    AND7: and_gate
        port map (A => A(7), B => B(7), Y => Y(7));

end Structural;