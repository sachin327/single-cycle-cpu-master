-- package declaration for single cycle CPU functional units

library ieee;
use ieee.std_logic_1164.all;


package Sachin_singleCycle is
    -- clock
    component Sachin_1HzClock2 is
        port(
	        signal CLK_50MHZ : in std_logic;
	        signal CLK_1HZ : out std_logic
        );
    end component Sachin_1HzClock2;    

    -- program counter
    component Sachin_programCounter is
        port(
            signal CLK, RESET : in std_logic;
            signal A : in std_logic_vector(31 downto 0);
            signal PC : inout std_logic_vector(31 downto 0)
        );
    end component Sachin_programCounter;    

    -- shift register
    component Sachin_shiftRegister2 is 
        port(
            signal SHIFT, CLK : in std_logic;
            signal LOAD : in std_logic_vector(7 downto 0);
            signal Q : out std_logic_vector(31 downto 0)
        );
    end component Sachin_shiftRegister2;

    -- instruction memory
    component Sachin_128x8InstructionMemory is  
        port(
            signal CLK, MEMWRITE : in std_logic;
            signal WRADDRESS : in std_logic_vector(6 downto 0);
            signal RDADDRESS, WRDATA : in std_logic_vector(31 downto 0);
            signal INSTRUCTION : out std_logic_vector(31 downto 0)
        );
    end component Sachin_128x8InstructionMemory;

    -- data memory
    component Sachin_256x8DataMemory is  
        port(
            signal CLK, MEMREAD, MEMWRITE : in std_logic;
            signal ADDRESS, WRDATA : in std_logic_vector(31 downto 0);
            signal DATAOUT : out std_logic_vector(31 downto 0)
        );
    end component Sachin_256x8DataMemory;

    -- register file
    component Sachin_3PortRegisterFile3 is
        port(
            signal REGWR, CLK : in std_logic;
            signal RD, RS, RT : in std_logic_vector(4 downto 0);
            signal WRDATA, LO, HI : in std_logic_vector(31 downto 0);
            signal RDATA1, RDATA2, RV : out std_logic_vector(31 downto 0)
        );
    end component Sachin_3PortRegisterFile3;

    -- adder
    component Sachin_32bitAdder is
        port(
            signal X, Y : in std_logic_vector(31 downto 0);
            signal SUM : out std_logic_vector(31 downto 0)
        );
    end component Sachin_32bitAdder;

    -- arithmetic-logical unit
    component Sachin_ALU is
        port(
            signal OPCODE : in std_logic_vector(3 downto 0);
            signal SHAMT : in std_logic_vector(4 downto 0);
            signal X, Y : in std_logic_vector(31 downto 0);
            signal Z : out std_logic;
            signal R, LO, HI : out std_logic_vector(31 downto 0)
        );
    end component Sachin_ALU;

    -- main control unit
    component Sachin_control is
        port(
            signal OPCODE : in std_logic_vector(5 downto 0);
            signal REGDST, ALUSRC, MEMTOREG, REGWRITE, MEMREAD : out std_logic;
            signal MEMWRITE, BRANCH, JUMP, JPLINK, JUMPRST : out std_logic;
            signal ALUOP : out std_logic_vector(1 downto 0)
        );
    end component Sachin_control;

    -- ALU control unit
    component Sachin_ALUcontrol is
        port(
            signal ALUOP : in std_logic_vector(1 downto 0);
            signal FUNCT : in std_logic_vector(5 downto 0);
            signal OPCODE : out std_logic_vector(3 downto 0)
        );
    end component Sachin_ALUcontrol;

    -- 32bit wide 2:1 multiplexer
    component Sachin_32bit2to1Mux is
        port(
            signal SEL : in std_logic;
            signal A, B : in std_logic_vector(31 downto 0);
            signal O : out std_logic_vector(31 downto 0)
        );
    end component Sachin_32bit2to1Mux;

    -- 5bit wide 2:1 multiplexer
    component Sachin_5bit2to1Mux is
        port(
            signal SEL : in std_logic;
            signal A, B : in std_logic_vector(4 downto 0);
            signal O : out std_logic_vector(4 downto 0)
        );
    end component Sachin_5bit2to1Mux;

    -- hexadecimal display decoder
    component Sachin_hexadecimalDisplayDecoder is
        port(
            signal DIN : in std_logic_vector(3 downto 0);
            signal DOUT : out std_logic_vector(6 downto 0)
        );
    end component Sachin_hexadecimalDisplayDecoder;
end package Sachin_singleCycle;