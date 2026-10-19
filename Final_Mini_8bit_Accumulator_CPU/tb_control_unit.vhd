
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_control_unit is
end tb_control_unit;

architecture Behavioral of tb_control_unit is

    component control_unit
        Port (
            OPCODE   : in  STD_LOGIC_VECTOR(3 downto 0);
            Z        : in  STD_LOGIC;
            ACC_LOAD : out STD_LOGIC;
            Z_LOAD   : out STD_LOGIC;
				ALU_SEL  : out STD_LOGIC_VECTOR(1 downto 0);
            USE_IMM  : out STD_LOGIC;
            PC_LOAD  : out STD_LOGIC
        );
    end component;

    signal OPCODE   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Z        : STD_LOGIC := '0';
    signal ACC_LOAD : STD_LOGIC;
    signal Z_LOAD   : STD_LOGIC;
    signal ALU_SEL  : STD_LOGIC_VECTOR(1 downto 0);
    signal USE_IMM  : STD_LOGIC;
    signal PC_LOAD  : STD_LOGIC;
	 
begin

    uut: control_unit
        port map (
            OPCODE => OPCODE,
            Z => Z,
            ACC_LOAD => ACC_LOAD,
            Z_LOAD => Z_LOAD,
            ALU_SEL => ALU_SEL,
            USE_IMM => USE_IMM,
            PC_LOAD => PC_LOAD
        );
		  
    stim_proc: process
    begin
        -- LDI
        OPCODE <= "0001"; Z <= '0';
        wait for 20 ns;

        -- ADD
        OPCODE <= "0010";
        wait for 20 ns;

        -- NOT
        OPCODE <= "0111";
        wait for 20 ns;

        -- SHL
        OPCODE <= "1000";
        wait for 20 ns;

        -- JZ with Z = 1: jump
        OPCODE <= "1100"; Z <= '1';
        wait for 20 ns;

        -- JZ with Z = 0: no jump
        Z <= '0';
        wait for 20 ns;

        report "Control Unit test completed." severity note;
        wait;
    end process;

end Behavioral;