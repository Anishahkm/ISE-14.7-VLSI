library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_not_gate_testbench is
end eight_bit_not_gate_testbench;

architecture Behavioral of eight_bit_not_gate_testbench is

    component eight_bit_not_gate
        Port (
            A : in  STD_LOGIC_VECTOR(7 downto 0);
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal A : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal Y : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT: eight_bit_not_gate
        port map (
            A => A,
            Y => Y
        );

    A <= "00000000",
         "11111111" after 100 ns,
         "10101010" after 200 ns,
         "11001100" after 300 ns,
         "01010101" after 400 ns;

end Behavioral;