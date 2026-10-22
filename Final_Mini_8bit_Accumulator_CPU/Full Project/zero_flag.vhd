
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_flag is
    Port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        Z_LOAD  : in  STD_LOGIC;
        ACC_IN  : in  STD_LOGIC_VECTOR(7 downto 0);
        Z       : out STD_LOGIC
    );
end zero_flag;

architecture Behavioral of zero_flag is
    signal Z_REG : STD_LOGIC := '1';
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                Z_REG <= '1';
            elsif Z_LOAD = '1' then
                if ACC_IN = x"00" then
                    Z_REG <= '1';
                else
                    Z_REG <= '0';
                end if;
            end if;
        end if;
    end process;

    Z <= Z_REG;
end Behavioral;