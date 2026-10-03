library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        SUM  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder;
architecture Structural of full_adder is

    component half_adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            SUM   : out STD_LOGIC;
            CARRY : out STD_LOGIC
        );
    end component;

    component or_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
	
    signal SUM1   : STD_LOGIC;
    signal CARRY1 : STD_LOGIC;
    signal CARRY2 : STD_LOGIC;

begin

    HA1: half_adder
        port map (
            A     => A,
            B     => B,
            SUM   => SUM1,
            CARRY => CARRY1
        );
    HA2: half_adder
        port map (
            A     => SUM1,
            B     => Cin,
            SUM   => SUM,
            CARRY => CARRY2
        );

    OR1: or_gate
        port map (
            A => CARRY1,
            B => CARRY2,
            Y => Cout
        );

end Structural;