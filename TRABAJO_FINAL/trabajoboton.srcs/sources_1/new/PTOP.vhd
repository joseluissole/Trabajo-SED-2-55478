----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2022 21:11:27
-- Design Name: 
-- Module Name: PTOP - Behavioral
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

entity PTOP is
    generic(
        MODULO : positive := 5000;   --modulo de la cuenta
        ANCHO : natural := 3         --ancho del contador
    );
    port(
        RISTRA_DIGITOS : in std_logic_vector (31 downto 0); --8 digitos BC para el display
        VSUALIZADOR : out std_logic_vector (7 downto 0); --encendido visualizador
        SEGMENT : out std_logic_vector (6 downto 0); --segmento decodificado
        
        CLK : in std_logic; --reloj
        RST_N : in std_logic    --reset
    
    );
    
end PTOP;

architecture Behavioral of PTOP is

component DESCONTADOR
generic(
        MODULO : positive := 5000 --modulo de la cuenta
    );

    port(
        fin_cuenta : out std_logic; --llega a 0

        CLK : in std_logic;         --reloj
        RST_N : in std_logic        --RESET

    );
end component;

component CONTADOR
    generic(
    
        ANCHO : natural := 3    --ancho del contador
    
    );
    
    port(
    
        CUENTA : out std_logic_vector (ANCHO -1 downto 0);
        
        RST_N : in std_logic;
        CE : in std_logic;
        CLK : in std_logic
    
    );
    
end component;

component DECODER

    GENERIC(
        RANGO_IN  : positive := 4;  --Rango del BCD
        RANGO_OUT : positive := 7   --Rango de display de 7 segmentos
    );
    PORT (
        code : IN std_logic_vector(RANGO_IN - 1 DOWNTO 0);  --Codigo BCD
        led : OUT std_logic_vector(RANGO_OUT -1 DOWNTO 0)   --Salida 7 segmentos
    );
END component;

component DECODER_OCTAL
    port(
        OCTAL : in std_logic_vector (2 downto 0);   --entrada cuebnta
        LINEA : out std_logic_vector (7 downto 0)   --display activo a nivel bajo
    );
end component;

component MUX32 is
port(
    INPUT : in std_logic_vector (31 downto 0); --entrada BCD
    SELECCIONAR : in std_logic_vector (2 downto 0); 
    OUTPUT : out std_logic_vector (3 downto 0)
   
);
end component;

signal FINCUENTA_DESCONTADOR2CONTADOR : std_logic;
signal CUENTA : std_logic_vector (ANCHO -1 downto 0);
signal DIGITO_BCD : std_logic_vector (3 downto 0);

begin

--DESCONTADOR reductor flancos
desc: DESCONTADOR
generic map(
        MODULO => MODULO --modulo de la cuenta
    )
    port map(
        fin_cuenta => FINCUENTA_DESCONTADOR2CONTADOR, --llega a 0

        CLK => CLK,         --reloj
        RST_N => RST_N        --RESET

    );
    
    
    --CONTADOR
cont: CONTADOR
    generic map(
    
        ANCHO => ANCHO    --ancho del contador
    )
    
    port map(
    
        CUENTA => CUENTA,
        
        RST_N => RST_N,
        CE => FINCUENTA_DESCONTADOR2CONTADOR,
        CLK => CLK
    
    );  
    
    --DECODER OCTAL  
    DEC8BIN: DECODER_OCTAL
    port map(
        OCTAL => CUENTA,   --entrada cuebnta
        LINEA => VSUALIZADOR   --display activo a nivel bajo
    );

    --MUX32
    M32: MUX32
port map(
    INPUT => RISTRA_DIGITOS, --entrada BCD
    SELECCIONAR => CUENTA, 
    OUTPUT => DIGITO_BCD
   
);

    --SEGMENTO
    DEC: DECODER
    PORT map (
        code => DIGITO_BCD,  --Codigo BCD
        led => SEGMENT   --Salida 7 segmentos
    );
    

end Behavioral;
