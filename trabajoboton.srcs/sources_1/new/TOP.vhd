library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
    generic(
        NUM_PISOS : positive := 4;       --numero de pisos del ascensor, incluye el bajo
        NUM_CICLOS : positive := 32     --numero de ciclos a dejar para evitar el rebote
    );

    port(
        PLANTA_D : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de boton
        PLANTA_A : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de planta

        MOTOR	: out std_logic_vector(1 downto 0);               --MOTOR
        PUERTA	: out std_logic;                                 --Puerta
        SEGMENTO : out std_logic_vector (6 downto 0);               --segmento
        VISUALIZADOR : out std_logic_vector (7 downto 0);           --visualizador

        CLK : in std_logic;     --RELOJ EN flanco positivo
        RST_N: in std_logic     --renincio asincrono con valor a '0'

    );
end TOP;

architecture Behavioral of TOP is
    component MAQ_ESTADOS is
        port(
            CLK		: in std_logic;
            RST_N	: in std_logic;
            A_MAY_B	: in std_logic;
            A_MEN_B	: in std_logic;
            A_IGU_B	: in std_logic;
            MOTOR	: out std_logic_vector(1 downto 0);
            PUERTA	: out std_logic
        );
    end component;

    component Comparador is
    	generic(
    		N : positive := 4
    	);
        Port (
            PA          : in STD_LOGIC_VECTOR(N-1 downto 0);    -- Entrada de piso actual
            PD          : in STD_LOGIC_VECTOR(N-1 downto 0);    -- Entrada de piso deseado

            PA_MAYOR_PD : out STD_LOGIC; -- PA > PD
            PA_MENOR_PD : out STD_LOGIC; -- PA < PD
            PA_IGUAL_PD : out STD_LOGIC  -- PA = PD
        );
    end component;
    
    component BOTON2BCD is
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
end component;

component decoder IS

    GENERIC(
        RANGO_IN  : positive := 4;  --Rango del BCD
        RANGO_OUT : positive := 7   --Rango de display de 7 segmentos
    );
    PORT (
        code : IN std_logic_vector(RANGO_IN - 1 DOWNTO 0);  --Codigo BCD
        led : OUT std_logic_vector(RANGO_OUT -1 DOWNTO 0)   --Salida 7 segmentos
    );
END component;

    signal PUERTA_I : std_logic;
    
    signal PD_BCD : std_logic_vector (3 downto 0);
    signal PA_BCD : std_logic_vector (3 downto 0);

    signal PA_MAYOR_PD_I : STD_LOGIC; -- PA > PD
    signal PA_MENOR_PD_I :  STD_LOGIC; -- PA < PD
    signal PA_IGUAL_PD_I : STD_LOGIC;  -- PA = PD


begin
        
        maq_est: MAQ_ESTADOS
        port map(
            CLK		=> CLK,
            RST_N	=> RST_N,
            A_MAY_B	=> PA_MAYOR_PD_I,
            A_MEN_B	=> PA_MENOR_PD_I,
            A_IGU_B	=> PA_IGUAL_PD_I,
            MOTOR	=> MOTOR,
            PUERTA	=> PUERTA
        );
    
    comp: Comparador
        Port  map (
            PA          => PA_BCD,   -- Entrada de piso actual
            PD          => PD_BCD,   -- Entrada de piso deseado

            PA_MAYOR_PD => PA_MAYOR_PD_I, -- PA > PD
            PA_MENOR_PD => PA_MENOR_PD_I, -- PA < PD
            PA_IGUAL_PD => PA_IGUAL_PD_I  -- PA = PD
        );
        
        actual : BOTON2BCD 
    generic map (
        N_PISOS => NUM_PISOS,    --numero de pisos entre 1 y 10
        RESET_VALUE => "1111"      --valor predeterminado para el reset del valor BCD
    )
    port map(
        INPUT_INTERRUPTOR => PLANTA_A,     --entrada de los pisos
        OUTPUT_BCD => PA_BCD,                   --salida de los pisos en BCD

        CLK => CLK,
        CE => '1',
        RST_N => RST_N
    );
    
    deseado : BOTON2BCD 
    generic map (
        N_PISOS => NUM_PISOS,    --numero de pisos entre 1 y 10
        RESET_VALUE => "0000"      --valor predeterminado para el reset del valor BCD
    )
    port map(
        INPUT_INTERRUPTOR => PLANTA_D,     --entrada de los pisos
        OUTPUT_BCD => PD_BCD,                   --salida de los pisos en BCD

        CLK => CLK,
        CE => PA_IGUAL_PD_I,
        RST_N => RST_N
    );
    
    cidificador7seg: decoder
    
    PORT map (
        code => PA_BCD,  --Codigo BCD
        led => SEGMENTO   --Salida 7 segmentos
    );
    
VISUALIZADOR <= "11111110";

end Behavioral;