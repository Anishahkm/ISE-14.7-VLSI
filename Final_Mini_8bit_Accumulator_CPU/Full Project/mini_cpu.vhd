
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mini_cpu is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR(7 downto 0);
        Z     : out STD_LOGIC;
        PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
    );
end mini_cpu;

architecture Structural of mini_cpu is

    signal PC_VALUE     : STD_LOGIC_VECTOR(3 downto 0);
    signal NEXT_PC      : STD_LOGIC_VECTOR(3 downto 0);
    signal INSTRUCTION  : STD_LOGIC_VECTOR(11 downto 0);
    signal OPCODE       : STD_LOGIC_VECTOR(3 downto 0);
    signal OPERAND      : STD_LOGIC_VECTOR(7 downto 0);

    signal ACC_VALUE    : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_RESULT   : STD_LOGIC_VECTOR(7 downto 0);
    signal ACC_INPUT    : STD_LOGIC_VECTOR(7 downto 0);

    signal ACC_LOAD     : STD_LOGIC;
    signal Z_LOAD       : STD_LOGIC;
    signal ALU_SEL      : STD_LOGIC_VECTOR(1 downto 0);
    signal USE_IMM      : STD_LOGIC;
    signal PC_LOAD      : STD_LOGIC;
    signal ZERO_VALUE   : STD_LOGIC;

begin

    OPCODE  <= INSTRUCTION(11 downto 8);
    OPERAND <= INSTRUCTION(7 downto 0);

   -- Program Counter
		   U_PC: entity work.program_counter
        port map (
            CLK     => CLK,
            RESET   => RESET,
            LOAD    => PC_LOAD,
            NEXT_PC => NEXT_PC,
            PC      => PC_VALUE
        );
		  
    -- Program ROM
    U_ROM: entity work.program_rom
        port map (
            ADDRESS => PC_VALUE,
            INSTRUCTION => INSTRUCTION
        );

    -- Control Unit
    U_CONTROL: entity work.control_unit
        port map (
            OPCODE => OPCODE,
            Z => ZERO_VALUE,
            ACC_LOAD => ACC_LOAD,
            Z_LOAD => Z_LOAD,
            ALU_SEL => ALU_SEL,
            USE_IMM => USE_IMM,
            PC_LOAD => PC_LOAD
        );

    -- ALU
    U_ALU: entity work.alu
        port map (
            A => ACC_VALUE,
            B => OPERAND,
            ALU_SEL => ALU_SEL,
            ALU_RESULT => ALU_RESULT
        );

    -- Select immediate or ALU result
    ACC_INPUT <= OPERAND when USE_IMM = '1' else ALU_RESULT;

    -- Accumulator
    U_ACC: entity work.accumulator
        port map (
            CLK => CLK,
            RESET => RESET,
            ACC_LOAD => ACC_LOAD,
            ACC_IN => ACC_INPUT,
            ACC_OUT => ACC_VALUE
        );
		  
    -- Zero Flag
    U_ZERO: entity work.zero_flag
        port map (
            CLK => CLK,
            RESET => RESET,
            Z_LOAD => Z_LOAD,
            ACC_IN => ACC_INPUT,
            Z => ZERO_VALUE
        );

    -- Jump target for JZ
    NEXT_PC <= OPERAND(3 downto 0) when PC_LOAD = '1'
               else std_logic_vector(unsigned(PC_VALUE) + 1);
Q <= ACC_VALUE;
    Z <= ZERO_VALUE;
    PC_OUT <= PC_VALUE;

end Structural;