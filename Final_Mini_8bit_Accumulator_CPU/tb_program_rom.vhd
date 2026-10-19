
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_program_rom is
end tb_program_rom;

architecture Behavioral of tb_program_rom is

    component program_rom
        Port (
            ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
            INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    signal ADDRESS     : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal INSTRUCTION : STD_LOGIC_VECTOR(11 downto 0);

begin

    uut: program_rom
        port map (
            ADDRESS     => ADDRESS,
            INSTRUCTION => INSTRUCTION
        );

    stim_proc: process
    begin
        ADDRESS <= "0000";
        wait for 20 ns;

        ADDRESS <= "0001";
        wait for 20 ns;

        ADDRESS <= "0010";
        wait for 20 ns;

        ADDRESS <= "0011";
        wait for 20 ns;

        ADDRESS <= "0100";
        wait for 20 ns;

        ADDRESS <= "0101";
        wait for 20 ns;

        ADDRESS <= "0110";
        wait for 20 ns;
		  ADDRESS <= "0111";
        wait for 20 ns;

        ADDRESS <= "1000";
        wait for 20 ns;

        ADDRESS <= "1001";
        wait for 20 ns;

        report "ROM test completed." severity note;
        wait;
    end process;

end Behavioral;