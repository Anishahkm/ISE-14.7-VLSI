library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_register is
    Port (
        D      : in  STD_LOGIC_VECTOR(3 downto 0);
        Enable : in  STD_LOGIC;
        Q      : out STD_LOGIC_VECTOR(3 downto 0)
    );
end four_bit_register;

architecture Structural of four_bit_register is

    component one_bit_register
        Port (
            D      : in  STD_LOGIC;
            Enable : in  STD_LOGIC;
            Q      : out STD_LOGIC
        );
    end component;
begin

    REG0: one_bit_register
        port map (
            D      => D(0),
            Enable => Enable,
            Q      => Q(0)
        );

    REG1: one_bit_register
        port map (
            D      => D(1),
            Enable => Enable,
            Q      => Q(1)
        );
	REG2: one_bit_register
        port map (
            D      => D(2),
            Enable => Enable,
            Q      => Q(2)
        );

    REG3: one_bit_register
        port map (
            D      => D(3),
            Enable => Enable,
            Q      => Q(3)
        );

end Structural;