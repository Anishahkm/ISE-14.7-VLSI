library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_full_adder is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        SUM  : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end eight_bit_full_adder;
architecture Structural of eight_bit_full_adder is

    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            SUM  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal C : STD_LOGIC_VECTOR(8 downto 0);

begin
	 C(0) <= Cin;

    FA0: full_adder
        port map (
            A    => A(0),
            B    => B(0),
            Cin  => C(0),
            SUM  => SUM(0),
            Cout => C(1)
        );

    FA1: full_adder
        port map (
            A    => A(1),
            B    => B(1),
            Cin  => C(1),
            SUM  => SUM(1),
            Cout => C(2)
        );
		     FA2: full_adder
        port map (
            A    => A(2),
            B    => B(2),
            Cin  => C(2),
            SUM  => SUM(2),
            Cout => C(3)
        );

    FA3: full_adder
        port map (
            A    => A(3),
            B    => B(3),
            Cin  => C(3),
            SUM  => SUM(3),
            Cout => C(4)
        );
		     FA4: full_adder
        port map (
            A    => A(4),
            B    => B(4),
            Cin  => C(4),
            SUM  => SUM(4),
            Cout => C(5)
        );

    FA5: full_adder
        port map (
            A    => A(5),
            B    => B(5),
            Cin  => C(5),
            SUM  => SUM(5),
            Cout => C(6)
        );
		    FA6: full_adder
        port map (
            A    => A(6),
            B    => B(6),
            Cin  => C(6),
            SUM  => SUM(6),
            Cout => C(7)
        );

    FA7: full_adder
        port map (
            A    => A(7),
            B    => B(7),
            Cin  => C(7),
            SUM  => SUM(7),
            Cout => C(8)
        );

    Cout <= C(8);

end Structural;