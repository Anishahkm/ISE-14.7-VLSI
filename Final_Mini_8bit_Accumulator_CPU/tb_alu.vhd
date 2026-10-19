
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu is
end tb_alu;

architecture Behavioral of tb_alu is

    component alu
        Port (
            A          : in  STD_LOGIC_VECTOR(7 downto 0);
            B          : in  STD_LOGIC_VECTOR(7 downto 0);
            ALU_SEL    : in  STD_LOGIC_VECTOR(1 downto 0);
            ALU_RESULT : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal A          : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal B          : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal ALU_SEL    : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal ALU_RESULT : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: alu
        port map (
            A          => A,
            B          => B,
            ALU_SEL    => ALU_SEL,
            ALU_RESULT => ALU_RESULT
        );

    stim_proc: process
    begin
        A <= x"10";
        B <= x"11";
        ALU_SEL <= "00";
        wait for 20 ns;

        A <= x"0F";
        B <= x"00";
        ALU_SEL <= "01";
        wait for 20 ns;

        A <= x"11";
        B <= x"00";
        ALU_SEL <= "10";
        wait for 20 ns;
		 
        A <= x"FF";
        B <= x"01";
        ALU_SEL <= "00";
        wait for 20 ns;

        report "ALU test completed." severity note;
        wait;
    end process;

end Behavioral; 