
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_adder_8bit IS
END tb_adder_8bit;

ARCHITECTURE behavior OF tb_adder_8bit IS

    COMPONENT adder_8bit
    PORT(
        A   : IN  std_logic_vector(7 downto 0);
        B   : IN  std_logic_vector(7 downto 0);
        SUM : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;

    SIGNAL A   : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL B   : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL SUM : std_logic_vector(7 downto 0);

BEGIN

    uut: adder_8bit PORT MAP (
        A   => A,
        B   => B,
        SUM => SUM
    );
	 
    stim_proc: PROCESS
    BEGIN
        -- Test 1: 3 + 5 = 8
        A <= "00000011";
        B <= "00000101";
        WAIT FOR 20 ns;

        -- Test 2: 2 + 1 = 3
        A <= "00000010";
        B <= "00000001";
        WAIT FOR 20 ns;

        -- Test 3: 255 + 1 = 0 (8-bit overflow)
        A <= "11111111";
        B <= "00000001";
        WAIT FOR 20 ns;
		  
        -- Test 4: 170 + 5 = 175
        A <= "10101010";
        B <= "00000101";
        WAIT FOR 20 ns;

        WAIT;
    END PROCESS;

END behavior;