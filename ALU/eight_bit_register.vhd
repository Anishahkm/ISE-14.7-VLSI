library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_register is
    Port (
        D      : in  STD_LOGIC_VECTOR(7 downto 0);
        Enable : in  STD_LOGIC;
        Q      : out STD_LOGIC_VECTOR(7 downto 0)
    );
end eight_bit_register;
architecture Structural of eight_bit_register is

    component four_bit_register
        Port (
            D      : in  STD_LOGIC_VECTOR(3 downto 0);
            Enable : in  STD_LOGIC;
            Q      : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
begin

    -- Lower 4 bits
    REG_LOW: four_bit_register
        port map (
            D      => D(3 downto 0),
            Enable => Enable,
            Q      => Q(3 downto 0)
        );
	 -- Upper 4 bits
    REG_HIGH: four_bit_register
        port map (
            D      => D(7 downto 4),
            Enable => Enable,
            Q      => Q(7 downto 4)
        );

end Structural;