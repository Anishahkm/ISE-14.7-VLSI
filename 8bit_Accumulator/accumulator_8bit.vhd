
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator_8bit is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        A     : in  STD_LOGIC_VECTOR(7 downto 0);
        B     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end accumulator_8bit;

architecture Structural of accumulator_8bit is

    component adder_8bit
        Port (
            A   : in  STD_LOGIC_VECTOR(7 downto 0);
            B   : in  STD_LOGIC_VECTOR(7 downto 0);
            SUM : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component register_8bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            D     : in  STD_LOGIC_VECTOR(7 downto 0);
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal SUM_WIRE : STD_LOGIC_VECTOR(7 downto 0);

begin

    U1: adder_8bit
        port map (
            A   => A,
            B   => B,
            SUM => SUM_WIRE
        );

    U2: register_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            D     => SUM_WIRE,
            Q     => Q
        );

end Structural;