
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity program_counter is
    Port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        LOAD    : in  STD_LOGIC;
        NEXT_PC : in  STD_LOGIC_VECTOR(3 downto 0);
        PC      : out STD_LOGIC_VECTOR(3 downto 0)
    );
end program_counter;

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