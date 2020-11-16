library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Sachin_ALU is
    port(
        signal OPCODE : in std_logic_vector(3 downto 0);
        signal SHAMT : in std_logic_vector(4 downto 0);
        signal X, Y : in std_logic_vector(31 downto 0);
        signal Z : out std_logic;
        signal R, LO, HI : out std_logic_vector(31 downto 0)
    );
end entity Sachin_ALU;


architecture structure of Sachin_ALU is
    -- intermediate signal

    begin

        operation : process(OPCODE, X, Y) -- may need to change
            -- variable declarations
            variable result, quotient, remainder : std_logic_vector(31 downto 0);
            variable product : std_logic_vector(63 downto 0);

            begin
                case OPCODE is
                    when "0001" => -- addition 
                        result := std_logic_vector(signed(X) + signed(Y));

                    when "0010" => -- subtraction 
                        result := std_logic_vector(signed(X) - signed(Y));

                    when "1001" => -- shift left logical 
                        result := std_logic_vector(signed(Y) sll to_integer(unsigned(SHAMT)));

                    when "1010" =>-- shift right logical 
                        result := std_logic_vector(signed(Y) srl to_integer(unsigned(SHAMT)));

                    when "1101" => -- set on less than
                        if signed(X) < signed(Y) then
                            result := X"00000001";
                        else 
                            result := (others => '0');
                        end if;
                        
                    when others => null;
                end case;

                if result = X"00000000" then
                    Z <= '1';
                else
                    Z <= '0';
                end if;

                R <= result;
        end process;

end architecture structure;