library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_register_testbench is
end four_bit_register_testbench;

architecture Behavioral of four_bit_register_testbench is

    component four_bit_register
        Port (
            D      : in  STD_LOGIC_VECTOR(3 downto 0);
            Enable : in  STD_LOGIC;
            Q      : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
	 signal D      : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Enable : STD_LOGIC := '0';
    signal Q      : STD_LOGIC_VECTOR(3 downto 0);

begin

    uut: four_bit_register
        port map (
            D      => D,
            Enable => Enable,
            Q      => Q
        );
		 -- Input data
    D <= "0000",
         "1011" after 100 ns,
         "0101" after 200 ns,
         "1100" after 300 ns;

    -- Enable signal
    Enable <= '0',
              '1' after 100 ns,
              '0' after 200 ns,
              '1' after 300 ns,
              '0' after 400 ns;

end Behavioral;