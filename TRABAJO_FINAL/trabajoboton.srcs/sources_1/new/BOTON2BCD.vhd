----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2022 18:06:15
-- Design Name: 
-- Module Name: BOTON2BCD - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BOTON2BCD is
    generic (
        N_PISOS : positive := 4;     --numero de pisos entre 1 y 10
        RESET_VALUE : std_logic_vector (3 downto 0) := "1111"       --valor predeterminado para el reset del valor BCD
    );
    port(
        INPUT_INTERRUPTOR : in std_logic_vector (N_PISOS - 1 downto 0);     --entrada de los pisos
        OUTPUT_BCD : out std_logic_vector (3 downto 0);                     --salida de los pisos en BCD

        CLK : in std_logic;
        CE : in std_logic;
        RST_N : in std_logic
    );
end BOTON2BCD;

architecture Behavioral of BOTON2BCD is
    component SYNCHRNZR is
        port (

            ASYNC_IN : in std_logic;    --Entrada asinctrcrona
            SYNC_OUT : out std_logic;   --Salida sincrona

            CLK : in std_logic;         --RELOJ EN flanco positivo
            CE: in std_logic;           --habilitacion de chip a '1'
            RST_N: in std_logic         --renincio asincrono con valor a '0'

        );
    end component;

    component PRIOR_ENCODER is
        generic(
            RESET_VALUE : std_logic_vector (3 downto 0) := "0000"
        );

        port(
            INPUT : in std_logic_vector (9 downto 0);   --entrada pulsadores codificador BCD 0-9
            RESET_N : in std_logic;                      --entrada reset
            CLK : in std_logic;                         --entrada reloj
            CE : in std_logic;                          --habilitacion de chip
            OUTPUT : out std_logic_vector (3 downto 0)  --salida digito BCD
        );
    end component;

    signal S2P : std_logic_vector (9 downto 0);     --conexion entre pulsaore y combinacional
begin

    NULOS : for i in 9 downto N_PISOS generate
        S2P(i) <= '0';
    end generate;

    BOTONES : for j in N_PISOS -1 downto 0 generate
        sincronizador_I: SYNCHRNZR port map
(
                ASYNC_IN => INPUT_INTERRUPTOR(j),    --Entrada asinctrcrona
                SYNC_OUT => S2P(j),   --Salida sincrona

                CLK => CLK,        --RELOJ EN flanco positivo
                CE => CE,          --habilitacion de chip a '1'
                RST_N => RST_N        --renincio asincrono con valor a '0'
            );
    end generate;

    ENC_BCD: PRIOR_ENCODER
        generic map (
            RESET_VALUE => RESET_VALUE

        )

        port map(
            INPUT => S2P,   --entrada pulsadores codificador BCD 0-9
            RESET_N => RST_N,                     --entrada reset
            CLK => CLK,                         --entrada reloj
            CE => CE,                          --habilitacion de chip
           
            OUTPUT => OUTPUT_BCD  --salida digito BCD

        );


end Behavioral;