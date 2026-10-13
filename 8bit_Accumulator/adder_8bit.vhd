
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder_8bit is
    Port (
        A   : in  STD_LOGIC_VECTOR(7 downto 0);
        B   : in  STD_LOGIC_VECTOR(7 downto 0);
        SUM : out STD_LOGIC_VECTOR(7 downto 0)
    );
end adder_8bit;

architecture Behavioral of adder_8bit is
begin

    SUM <= STD_LOGIC_VECTOR(unsigned(A) + unsigned(B));

end Behavioral;