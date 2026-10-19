
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_registers is
end tb_registers;

architecture Behavioral of tb_registers is

    component accumulator
        Port (
            CLK      : in  STD_LOGIC;
            RESET    : in  STD_LOGIC;
            ACC_LOAD : in  STD_LOGIC;
            ACC_IN   : in  STD_LOGIC_VECTOR(7 downto 0);
            ACC_OUT  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;
	 
    component zero_flag
        Port (
            CLK     : in  STD_LOGIC;
            RESET   : in  STD_LOGIC;
            Z_LOAD  : in  STD_LOGIC;
            ACC_IN  : in  STD_LOGIC_VECTOR(7 downto 0);
            Z       : out STD_LOGIC
        );
    end component;

    signal CLK      : STD_LOGIC := '0';
    signal RESET   : STD_LOGIC := '0';
    signal ACC_LOAD : STD_LOGIC := '0';
    signal Z_LOAD   : STD_LOGIC := '0';
    signal ACC_IN   : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal ACC_OUT  : STD_LOGIC_VECTOR(7 downto 0);
    signal Z        : STD_LOGIC;

begin

    CLK <= not CLK after 10 ns;

    U1: accumulator
        port map (
            CLK => CLK,
            RESET => RESET,
            ACC_LOAD => ACC_LOAD,
            ACC_IN => ACC_IN,
            ACC_OUT => ACC_OUT
        );

    U2: zero_flag
        port map (
            CLK => CLK,
            RESET => RESET,
            Z_LOAD => Z_LOAD,
            ACC_IN => ACC_IN,
            Z => Z
        );

    stim_proc: process
    begin
        RESET <= '1';
        wait for 20 ns;

        RESET <= '0';
        ACC_LOAD <= '1';
        Z_LOAD <= '1';
        ACC_IN <= x"25";
        wait for 20 ns;

        ACC_IN <= x"00";
        wait for 20 ns;

        ACC_LOAD <= '0';
        Z_LOAD <= '0';
        ACC_IN <= x"55";
        wait for 20 ns;

        report "Register test completed." severity note;
        wait;
    end process;

end Behavioral;