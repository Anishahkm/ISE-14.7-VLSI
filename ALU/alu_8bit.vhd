library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin    : in  STD_LOGIC;
        OpSel  : in  STD_LOGIC_VECTOR(2 downto 0);
        Result : out STD_LOGIC_VECTOR(7 downto 0);
        Cout   : out STD_LOGIC
    );
end alu_8bit;

architecture Structural of alu_8bit is

    component eight_bit_full_adder
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            Cin  : in  STD_LOGIC;
            SUM  : out STD_LOGIC_VECTOR(7 downto 0);
            Cout : out STD_LOGIC
        );
    end component;
	 
    component logic_unit
        Port (
            A   : in  STD_LOGIC_VECTOR(7 downto 0);
            B   : in  STD_LOGIC_VECTOR(7 downto 0);
            Sel : in  STD_LOGIC_VECTOR(1 downto 0);
            Y   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal ADD_RESULT   : STD_LOGIC_VECTOR(7 downto 0);
    signal ADD_COUT     : STD_LOGIC;

    signal LOGIC_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal LOGIC_SEL    : STD_LOGIC_VECTOR(1 downto 0);

begin

    ADDER: eight_bit_full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            SUM  => ADD_RESULT,
            Cout => ADD_COUT
        );
		  
    LOGIC: logic_unit
        port map (
            A   => A,
            B   => B,
            Sel => LOGIC_SEL,
            Y   => LOGIC_RESULT
        );

    process(OpSel, ADD_RESULT, ADD_COUT, LOGIC_RESULT)
    begin

        Cout <= '0';

        case OpSel is
		  
            when "000" =>
                Result <= ADD_RESULT;
                Cout   <= ADD_COUT;

            when "001" =>
                Result <= ADD_RESULT;
                Cout   <= ADD_COUT;

            when "010" =>
                Result <= LOGIC_RESULT;

            when "011" =>
                Result <= LOGIC_RESULT;
					 
            when "100" =>
                Result <= LOGIC_RESULT;

            when "101" =>
                Result <= LOGIC_RESULT;

            when others =>
                Result <= "00000000";
                Cout   <= '0';

        end case;

    end process;

    process(OpSel)
    begin

        case OpSel is

            when "010" =>
                LOGIC_SEL <= "00";

            when "011" =>
                LOGIC_SEL <= "01";

            when "100" =>
                LOGIC_SEL <= "10";
					 
            when "101" =>
                LOGIC_SEL <= "11";

            when others =>
                LOGIC_SEL <= "00";

        end case;

    end process;

end Structural;