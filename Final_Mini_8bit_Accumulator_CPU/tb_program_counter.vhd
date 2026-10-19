
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_program_counter is
end tb_program_counter;

architecture Behavioral of tb_program_counter is

    component program_counter
        Port (
            CLK     : in  STD_LOGIC;
            RESET   : in  STD_LOGIC;
            LOAD    : in  STD_LOGIC;
            NEXT_PC : in  STD_LOGIC_VECTOR(3 downto 0);
            PC      : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal CLK     : STD_LOGIC := '0';
    signal RESET   : STD_LOGIC := '0';
    signal LOAD    : STD_LOGIC := '0';
    signal NEXT_PC : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal PC      : STD_LOGIC_VECTOR(3 downto 0);

begin

    uut: program_counter
        port map (
            CLK     => CLK,
            RESET   => RESET,
            LOAD    => LOAD,
            NEXT_PC => NEXT_PC,
            PC      => PC
        );

    CLK <= not CLK after 10 ns;
	 
    stim_proc: process
    begin
        -- Reset PC to 0
        RESET <= '1';
        wait until rising_edge(CLK);
        wait for 1 ns;

        -- Normal increment: PC becomes 1
        RESET <= '0';
        wait until rising_edge(CLK);
        wait for 1 ns;

        -- Normal increment: PC becomes 2
        wait until rising_edge(CLK);
        wait for 1 ns;
-- Jump to address 5
        LOAD <= '1';
        NEXT_PC <= "0101";
        wait until rising_edge(CLK);
        wait for 1 ns;

        -- Resume increment: PC becomes 6
        LOAD <= '0';
        wait until rising_edge(CLK);
        wait for 1 ns;

        report "PC test completed." severity note;
        wait;
    end process;

end Behavioral;