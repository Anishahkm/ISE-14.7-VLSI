
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port (
        A          : in  STD_LOGIC_VECTOR(7 downto 0);
        B          : in  STD_LOGIC_VECTOR(7 downto 0);
        ALU_SEL    : in  STD_LOGIC_VECTOR(1 downto 0);
        ALU_RESULT : out STD_LOGIC_VECTOR(7 downto 0)
    ); 
end alu;

architecture Behavioral of alu is
begin

    process(A, B, ALU_SEL)
    begin
        case ALU_SEL is

            when "00" =>
                ALU_RESULT <= std_logic_vector(
                    unsigned(A) + unsigned(B)
                );

            when "01" =>
                ALU_RESULT <= not A;

            when "10" =>
                ALU_RESULT <= A(6 downto 0) & '0';
when others =>
                ALU_RESULT <= (others => '0');

        end case;
    end process;

end Behavioral;