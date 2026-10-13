
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_register_8bit is
end tb_register_8bit;

architecture Behavioral of tb_register_8bit is

    component register_8bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            D     : in  STD_LOGIC_VECTOR(7 downto 0);
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
	 
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal D     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: register_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            D     => D,
            Q     => Q
        );
		  
    -- Clock period = 20 ns
    CLK <= not CLK after 10 ns;

    stim_proc: process
    begin
        -- Test 1: Synchronous reset
        RESET <= '1';
        D <= "11111111";
        wait until rising_edge(CLK);
        wait for 1 ns;

        -- Test 2: Store 8
        RESET <= '0';
        D <= "00001000";
        wait until rising_edge(CLK);
        wait for 1 ns;
		  
        -- Test 3: Change D without a rising edge
        D <= "00000011";
        wait for 5 ns;

        -- Test 4: Store new value at rising edge
        wait until rising_edge(CLK);
        wait for 1 ns;

        -- Test 5: Reset has priority
        RESET <= '1';
        D <= "10101111";
        wait until rising_edge(CLK);
        wait for 1 ns;

        wait;
    end process;
	 
end Behavioral;