library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Sachin_32bitAdder is
    port(
        signal X, Y : in std_logic_vector(31 downto 0);
        signal SUM : out std_logic_vector(31 downto 0)
    );
end entity Sachin_32bitAdder;


architecture behavior of Sachin_32bitAdder is
    begin
        SUM <= std_logic_vector(signed(X) + signed(Y));
end architecture behavior;