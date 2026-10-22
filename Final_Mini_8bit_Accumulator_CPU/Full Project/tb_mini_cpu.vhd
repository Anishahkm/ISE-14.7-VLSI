library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mini_cpu is
end tb_mini_cpu;

architecture Behavioral of tb_mini_cpu is

    signal CLK    : STD_LOGIC := '0';
    signal RESET  : STD_LOGIC := '1';
    signal Q      : STD_LOGIC_VECTOR(7 downto 0);
    signal Z      : STD_LOGIC;
    signal PC_OUT : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Unit Under Test
    UUT: entity work.mini_cpu
        port map (
            CLK     => CLK,
            RESET   => RESET,
            Q       => Q,
            Z       => Z,
            PC_OUT  => PC_OUT
        );

    -- Clock generation: 10 ns period
    CLK <= not CLK after 5 ns;

    -- Test process
    process
    begin
	 
        -- Apply reset
        RESET <= '1';
        wait until rising_edge(CLK);
        wait for 1 ns;

        -- Release reset
        RESET <= '0';
		  
        -- Execute 8 instruction cycles
        for i in 1 to 8 loop
            wait until rising_edge(CLK);
            wait for 1 ns;

            report "Cycle " & integer'image(i) &
                   " | PC = " &
                   integer'image(to_integer(unsigned(PC_OUT))) &
                   " | Q = " &
                   integer'image(to_integer(unsigned(Q))) &
                   " | Z = " &
                   STD_LOGIC'image(Z);
        end loop;

        wait;
    end process;

end Behavioral;