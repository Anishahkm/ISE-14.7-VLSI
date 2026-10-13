
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_accumulator is
end tb_accumulator;

architecture Behavioral of tb_accumulator is

    component accumulator_8bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            A     : in  STD_LOGIC_VECTOR(7 downto 0);
            B     : in  STD_LOGIC_VECTOR(7 downto 0);
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
	 
    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal A     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal B     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: accumulator_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            A     => A,
            B     => B,
            Q     => Q
        );

    CLK <= not CLK after 10 ns;

    stim_proc: process
    begin
	   -- Test 1: Reset
        RESET <= '1';
        A <= x"00";
        B <= x"00";
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"00"
            report "Test 1 failed: Reset"
            severity error;

        -- Test 2: 03 + 05 = 08
        RESET <= '0';
        A <= x"03";
        B <= x"05";
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"08"
            report "Test 2 failed: 03 + 05"
            severity error;
				
        -- Test 3: 02 + 01 = 03
        A <= x"02";
        B <= x"01";
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"03"
            report "Test 3 failed: 02 + 01"
            severity error;

        -- Test 4: FF + 01 = 00 (8-bit overflow)
        A <= x"FF";
        B <= x"01";
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"00"
            report "Test 4 failed: FF + 01"
            severity error;
				
        -- Test 5: AA + 05 = AF
        A <= x"AA";
        B <= x"05";
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"AF"
            report "Test 5 failed: AA + 05"
            severity error;

        report "All accumulator test cases completed."
            severity note;

        wait;
    end process;

end Behavioral;