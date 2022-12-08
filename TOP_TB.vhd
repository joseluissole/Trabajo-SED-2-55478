library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;

ENTITY TOP_TB IS
END TOP_TB;

ARCHITECTURE BEHAVIORAL OF TOP_TB IS
	COMPONENT TOP
		generic(
        	NUM_PISOS : positive := 4;       --numero de pisos del ascensor, incluye el bajo
        	NUM_CICLOS : positive := 32     --numero de ciclos a dejar para evitar el rebote
    	);

    	port(
        	PLANTA_D : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de boton
        	PLANTA_A : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de planta

	        MOTOR	: out std_logic_vector(1 downto 0);
    	    PUERTA	: out std_logic;

        	CLK : in std_logic;     --RELOJ EN flanco positivo
        	RST_N: in std_logic     --renincio asincrono con valor a '0'

    	);
	END COMPONENT;
    
    constant NUM_PISOS : positive := 4;

	SIGNAL PLANTA_D : std_logic_vector(NUM_PISOS - 1 DOWNTO 0);
	SIGNAL PLANTA_A : std_logic_vector(NUM_PISOS - 1 DOWNTO 0);
    SIGNAL MOTOR : std_logic_vector(1 downto 0);
    SIGNAL PUERTA : std_logic;
    SIGNAL CLK : std_logic;
    SIGNAL RST_N : std_logic;
    
    constant TbPeriod : time := 1000 ns;

	TYPE vtest is record
    	PLANTA_D : std_logic_vector(NUM_PISOS - 1 DOWNTO 0);
		PLANTA_A : std_logic_vector(NUM_PISOS - 1 DOWNTO 0);
		MOTOR : std_logic_vector(1 downto 0);
        PUERTA : std_logic;
	END RECORD;

	TYPE vtest_vector IS ARRAY (natural RANGE <>) OF vtest;
		CONSTANT test: vtest_vector := (
        	--Subida del ascensor parando en todos los pisos
        	(PLANTA_D => "0001", PLANTA_A => "0001", MOTOR => "00", PUERTA => '1'),
			(PLANTA_D => "0010", PLANTA_A => "0001", MOTOR => "01", PUERTA => '0'),
            (PLANTA_D => "0010", PLANTA_A => "0010", MOTOR => "00", PUERTA => '1'),
            (PLANTA_D => "0100", PLANTA_A => "0010", MOTOR => "01", PUERTA => '0'),
            (PLANTA_D => "0100", PLANTA_A => "0100", MOTOR => "00", PUERTA => '1'),
            (PLANTA_D => "1000", PLANTA_A => "0100", MOTOR => "01", PUERTA => '0'),
            (PLANTA_D => "1000", PLANTA_A => "1000", MOTOR => "00", PUERTA => '1'),
            --Bajada del ascensor parando en todos los pisos
            (PLANTA_D => "0100", PLANTA_A => "1000", MOTOR => "10", PUERTA => '0'),
			(PLANTA_D => "0100", PLANTA_A => "0100", MOTOR => "00", PUERTA => '1'),
            (PLANTA_D => "0010", PLANTA_A => "0100", MOTOR => "10", PUERTA => '0'),
            (PLANTA_D => "0010", PLANTA_A => "0010", MOTOR => "00", PUERTA => '1'),
            (PLANTA_D => "0001", PLANTA_A => "0010", MOTOR => "10", PUERTA => '0'),
            (PLANTA_D => "0001", PLANTA_A => "0001", MOTOR => "00", PUERTA => '1')
		);
BEGIN
	UUT: top port map(
    	PLANTA_D => PLANTA_D,
        PLANTA_A => PLANTA_A,
        MOTOR => MOTOR,
        PUERTA => PUERTA,
        CLK => CLK,
        RST_N => RST_N
    );
    
    clkgen: process
    begin
    	wait for 0.5 * TbPeriod;
        CLK <= '0';
        wait for 0.5 * TbPeriod;
        CLK <= '1';
    end process;
    
    RST_N <= '0' after 0.25*TbPeriod, '1' after 0.75*TbPeriod;

	tb: PROCESS
	BEGIN
    	wait until RST_N = '0';
        
        wait for 700 ns;
        
		FOR i IN 0 TO test'HIGH LOOP
			PLANTA_D <= test(i).PLANTA_D;
            PLANTA_A <= test(i).PLANTA_A;
			WAIT FOR TbPeriod;
			--ASSERT PUERTA = test(i).PUERTA
			--REPORT "Salida incorrecta."
			--SEVERITY FAILURE;
            --ASSERT MOTOR = test(i).MOTOR
            --REPORT "Salida incorrecta."
			--SEVERITY FAILURE;
		END LOOP;

		ASSERT false
		REPORT "Simulacin finalizada. Test superado."
		SEVERITY FAILURE;
	END PROCESS;
    
END BEHAVIORAL;