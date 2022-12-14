----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2022 19:11:58
-- Design Name: 
-- Module Name: BOTON2BCD_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BOTON2BCD_TB is
    --  Port ( );
end BOTON2BCD_TB;

architecture Behavioral of BOTON2BCD_TB is
    component BOTON2BCD
        generic (
            N_PISOS : positive := 4;     --numero de pisos entre 1 y 10
            RESET_VALUE : std_logic_vector (3 downto 0) := "0000"       --valor predeterminado para el reset del valor BCD
        );
        port(
            INPUT_INTERRUPTOR : in std_logic_vector (N_PISOS - 1 downto 0);
            OUTPUT_BCD : out std_logic_vector (3 downto 0);

            CLK : in std_logic;
            CE : in std_logic;
            RST_N : in std_logic
        );
    end component;

    constant N_PISOS : positive := 4;

    signal INPUT_INTERRUPTOR : std_logic_vector (N_PISOS -1 downto 0) := (others => '0');
    signal OUTPUT_BCD : std_logic_vector (3 downto 0);

    signal CLK : std_logic := '0';
    signal CE : std_logic := '1';
    signal RST_N : std_logic := '1';

    constant CLK_PERIOD : time := 10 ns;
    constant DELAY : time := 0.1*CLK_PERIOD;

    constant RESET_VALUE : std_logic_vector (3 downto 0) := "1111";


begin

    PRUEBA:  BOTON2BCD
        generic map (
            N_PISOS => N_PISOS,     --numero de pisos entre 1 y 10
            RESET_VALUE => RESET_VALUE    --valor predeterminado para el reset del valor BCD
        )
        port map(
            INPUT_INTERRUPTOR => INPUT_INTERRUPTOR,
            OUTPUT_BCD => OUTPUT_BCD,

            CLK => CLK,
            CE => CE,
            RST_N => RST_N
        );


    CLK <= not CLK after 0.5*CLK_PERIOD;

    RST_N <= '0' after 0.25*CLK_PERIOD, '1' after 1.75*CLK_PERIOD;

    uut : process
    begin

        wait until RST_N = '0';
        wait until RST_N = '1';

        wait until CLK <= '1';
        wait for DELAY;

        CE <= '1';

        wait for 2* CLK_PERIOD;


        for i in 0 to N_PISOS - 1 loop
            CE <= '1';
            wait for 10*CLK_PERIOD;
            INPUT_INTERRUPTOR (i) <= '1';
            wait for 10*CLK_PERIOD;

            INPUT_INTERRUPTOR <= ( others => '0');
            wait for 10*CLK_PERIOD;
            CE <= '0';
            wait for 10*CLK_PERIOD;

            for j in 0 to N_PISOS - 1 loop
                INPUT_INTERRUPTOR (j) <= '1';
                wait for 10*CLK_PERIOD;

                INPUT_INTERRUPTOR <= ( others => '0');
                wait for 10*CLK_PERIOD;

            end loop;

            wait for 10*CLK_PERIOD;

            assert to_integer(unsigned(OUTPUT_BCD)) = i
            report integer'image(to_integer(unsigned(OUTPUT_BCD))) & " no vale " & integer'image(i)
            severity FAILURE;


        end loop;

        wait for 20*CLK_PERIOD;

        for i in 0 to N_PISOS -1 loop
            CE <= '1';
            wait for 10*CLK_PERIOD;
            INPUT_INTERRUPTOR (i) <= '1';
            wait for 10*CLK_PERIOD;

            INPUT_INTERRUPTOR <= ( others => '0');
            wait for 10*CLK_PERIOD;
            CE <= '0';
            wait for 10*CLK_PERIOD;

            for j in N_PISOS -1 downto 0 loop
                INPUT_INTERRUPTOR(j) <= '1';
                wait for 10*CLK_PERIOD;
                INPUT_INTERRUPTOR <= ( others => '0');
                wait for 10*CLK_PERIOD;

            end loop;

            wait for 10*CLK_PERIOD;

            assert to_integer(unsigned(OUTPUT_BCD)) = i
            report integer'image(to_integer(unsigned(OUTPUT_BCD))) & " no vale " & integer'image(i)
            severity FAILURE;

        end loop;



        wait for 20*CLK_PERIOD;

        assert FALSE
        report "fin correcto"
        severity FAILURE;

    end process;


end Behavioral;
