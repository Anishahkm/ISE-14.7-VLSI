
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator is
    Port (
        CLK      : in  STD_LOGIC;
        RESET    : in  STD_LOGIC;
        ACC_LOAD : in  STD_LOGIC;
        ACC_IN   : in  STD_LOGIC_VECTOR(7 downto 0);
        ACC_OUT  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end accumulator;

architecture Behavioral of accumulator is

    signal ACC_REG : STD_LOGIC_VECTOR(7 downto 0) := x"00";

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                ACC_REG <= x"00";
            elsif ACC_LOAD = '1' then
                ACC_REG <= ACC_IN;
            end if;
        end if;
    end process;

    ACC_OUT <= ACC_REG;

end Behavioral;