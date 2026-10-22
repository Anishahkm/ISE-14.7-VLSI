
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port (
        OPCODE   : in  STD_LOGIC_VECTOR(3 downto 0);
        Z        : in  STD_LOGIC;
        ACC_LOAD : out STD_LOGIC;
        Z_LOAD   : out STD_LOGIC;
        ALU_SEL  : out STD_LOGIC_VECTOR(1 downto 0);
        USE_IMM  : out STD_LOGIC;
        PC_LOAD  : out STD_LOGIC
    );
end control_unit;

architecture Behavioral of control_unit is
begin
    process(OPCODE, Z)
    begin
        ACC_LOAD <= '0';
        Z_LOAD   <= '0';
        ALU_SEL  <= "00";
        USE_IMM  <= '0';
        PC_LOAD  <= '0';

        case OPCODE is

            -- LDI: Load immediate value into ACC
            when "0001" =>
                ACC_LOAD <= '1';
                Z_LOAD   <= '1';
                USE_IMM  <= '1';

            -- ADD: ACC = ACC + immediate
            when "0010" =>
                ACC_LOAD <= '1';
                Z_LOAD   <= '1';
                ALU_SEL  <= "00";

            -- NOT: ACC = NOT ACC
            when "0111" =>
                ACC_LOAD <= '1';
                Z_LOAD   <= '1';
                ALU_SEL  <= "01";

            -- SHL: Shift ACC left by one bit
            when "1000" =>
                ACC_LOAD <= '1';
                Z_LOAD   <= '1';
                ALU_SEL  <= "10";

            -- JZ: Jump if Z = 1
            when "1100" =>
                if Z = '1' then
                    PC_LOAD <= '1';
                end if;

            when others =>
                null;

        end case;
    end process;
end Behavioral;