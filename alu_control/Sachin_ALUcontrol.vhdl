library ieee;
use ieee.std_logic_1164.all;


entity Sachin_ALUcontrol is
    port(
        signal ALUOP : in std_logic_vector(1 downto 0);
        signal FUNCT : in std_logic_vector(5 downto 0);
        signal OPCODE : out std_logic_vector(3 downto 0)
    );
end entity Sachin_ALUcontrol;


architecture behavior of Sachin_ALUcontrol is 
    begin

        process(ALUOP, FUNCT)
            begin

                case ALUOP is
                    when "00" => -- addition
                        OPCODE <= "0010";

                    when "01" => -- subtraction
                        OPCODE <= "0110";

                    when "10" => -- determined by funct code
                        case FUNCT is
                            when "100000" => -- 20h
                                OPCODE <= "0010"; -- add

                            when "100010" => -- 22h
                                OPCODE <= "0110"; -- sub                                

                            when "100100" => -- 24h
                                OPCODE <= "0000"; -- and

                            when "100101" => -- 25h
                                OPCODE <= "0001"; -- or

                            when "101010" => -- 2ah
                                OPCODE <= "0111"; -- slt

                            when others => null;
                        end case;

                    when others => null;
                end case;
        end process;
end architecture behavior;