-- 5-bit wide 2:1 multiplexer

library ieee;
use ieee.std_logic_1164.all;


entity Sachin_5bit2to1Mux is
    port(
        signal SEL : in std_logic;
        signal A, B : in std_logic_vector(4 downto 0);
        signal O : out std_logic_vector(4 downto 0)
    );
end entity Sachin_5bit2to1Mux;


architecture behavior of Sachin_5bit2to1Mux is
    begin
        process(A, B, SEL)
            begin
                if SEL = '0' then
                    O <= A;
                elsif SEL = '1' then
                    O <= B;
                end if;
        end process;
end architecture behavior;