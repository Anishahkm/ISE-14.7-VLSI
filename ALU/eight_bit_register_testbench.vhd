library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_register_testbench is
end eight_bit_register_testbench;

architecture Behavioral of eight_bit_register_testbench is

    component eight_bit_register
        Port (
            D      : in  STD_LOGIC_VECTOR(7 downto 0);
            Enable : in  STD_LOGIC;
            Q      : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
	  signal D      : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal Enable : STD_LOGIC := '0';
    signal Q      : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: eight_bit_register
        port map (
            D      => D,
            Enable => Enable,
            Q      => Q
        );
		  -- Test data
    D <= "00000000",
         "10110110" after 100 ns,
         "01011010" after 200 ns,
         "11001100" after 300 ns;

    -- Enable
    Enable <= '0',
              '1' after 100 ns,
              '0' after 200 ns,
              '1' after 300 ns,
              '0' after 400 ns;

end Behavioral;