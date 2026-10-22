
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_rom is
    Port (
        ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
    );
end program_rom;

architecture Behavioral of program_rom is

    type ROM_TYPE is array (0 to 15) of
        STD_LOGIC_VECTOR(11 downto 0);
		  constant PROGRAM : ROM_TYPE := (
        0  => x"1FF", -- LDI FF
        1  => x"700", -- NOT
        2  => x"C05", -- JZ 05
        3  => x"277", -- ADD 77
        4  => x"277", -- ADD 77
        5  => x"211", -- ADD 11
        6  => x"800", -- SHL
        7  => x"C00", -- JZ 00
        8  => x"800", -- SHL
        others => x"000"
    );

begin

    INSTRUCTION <= PROGRAM(to_integer(unsigned(ADDRESS)));

end Behavioral;

architecture Behavioral of program_counter is

    signal PC_REG : unsigned(3 downto 0) := (others => '0');

begin

    process(CLK)
    begin
        if rising_edge(CLK) then

            if RESET = '1' then
                PC_REG <= (others => '0');

            elsif LOAD = '1' then
                PC_REG <= unsigned(NEXT_PC);
					 
            else
                PC_REG <= PC_REG + 1;

            end if;

        end if;
    end process;

    PC <= std_logic_vector(PC_REG);

end Behavioral;