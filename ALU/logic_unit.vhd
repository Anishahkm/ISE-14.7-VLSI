library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_unit is
    Port (
        A   : in  STD_LOGIC_VECTOR(7 downto 0);
        B   : in  STD_LOGIC_VECTOR(7 downto 0);
        Sel : in  STD_LOGIC_VECTOR(1 downto 0);
        Y   : out STD_LOGIC_VECTOR(7 downto 0)
    );
end logic_unit;

architecture Behavioral of logic_unit is

    component eight_bit_and_gate
        Port (
            A : in  STD_LOGIC_VECTOR(7 downto 0);
            B : in  STD_LOGIC_VECTOR(7 downto 0);
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component eight_bit_or_gate
        Port (
            A : in  STD_LOGIC_VECTOR(7 downto 0);
            B : in  STD_LOGIC_VECTOR(7 downto 0);
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component eight_bit_xor_gate
        Port (
            A : in  STD_LOGIC_VECTOR(7 downto 0);
            B : in  STD_LOGIC_VECTOR(7 downto 0);
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component eight_bit_not_gate
        Port (
            A : in  STD_LOGIC_VECTOR(7 downto 0);
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal AND_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal OR_RESULT  : STD_LOGIC_VECTOR(7 downto 0);
    signal XOR_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal NOT_RESULT : STD_LOGIC_VECTOR(7 downto 0);

begin

    AND_UNIT: eight_bit_and_gate
        port map (
            A => A,
            B => B,
            Y => AND_RESULT
        );

    OR_UNIT: eight_bit_or_gate
        port map (
            A => A,
            B => B,
            Y => OR_RESULT
        );

    XOR_UNIT: eight_bit_xor_gate
        port map (
            A => A,
            B => B,
            Y => XOR_RESULT
        );

    NOT_UNIT: eight_bit_not_gate
        port map (
            A => A,
            Y => NOT_RESULT
        );
		  
    process(Sel, AND_RESULT, OR_RESULT, XOR_RESULT, NOT_RESULT)
    begin

        case Sel is

            when "00" =>
                Y <= AND_RESULT;

            when "01" =>
                Y <= OR_RESULT;

            when "10" =>
                Y <= XOR_RESULT;

            when "11" =>
                Y <= NOT_RESULT;

            when others =>
                Y <= "00000000";

        end case;

    end process;

end Behavioral;