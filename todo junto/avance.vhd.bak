-- Copyright (C) 2024  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"
-- CREATED		"Sat Nov 16 18:43:04 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY avance IS 
	
	PORT
	  (clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		ADC_DOUT :  IN  STD_LOGIC;
		
		M0D :  OUT  STD_LOGIC;					--salidas a motores
		M1D :  OUT  STD_LOGIC;					--	
		M0I :  OUT  STD_LOGIC;					--
		M1I :  OUT  STD_LOGIC;					--
		Hab_D :  OUT  STD_LOGIC;				--velocidades
		Hab_I :  OUT  STD_LOGIC;				--
		
		ADC_SCLK :  OUT  STD_LOGIC;
		ADC_CS_N :  OUT  STD_LOGIC;
		ADC_DIN :  OUT  STD_LOGIC;
		c1 :  OUT  STD_LOGIC;
		
		CH0 :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);		--solo usamos CH0 y CH1
		CH1 :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);		--
		CH2 :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		CH3 :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		CH4 :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		CH5 :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		CH6 :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0);
		CH7 :  OUT  STD_LOGIC_VECTOR(11 DOWNTO 0));
		
END avance;


ARCHITECTURE bdf_type OF avance IS 

	COMPONENT pll
		PORT(inclk0 : IN STD_LOGIC;
			 areset : IN STD_LOGIC;
			 c0 : OUT STD_LOGIC;
			 c1 : OUT STD_LOGIC;
			 locked : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT avancefijo
		PORT(reset : IN STD_LOGIC;
			 clock : IN STD_LOGIC;
			 SI : IN STD_LOGIC;
			 SD : IN STD_LOGIC;
			 M0D : OUT STD_LOGIC;
			 M1D : OUT STD_LOGIC;
			 M0I : OUT STD_LOGIC;
			 M1I : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT adc
		PORT(CLOCK : IN STD_LOGIC;
			 ADC_DOUT : IN STD_LOGIC;
			 RESET : IN STD_LOGIC;
			 ADC_SCLK : OUT STD_LOGIC;
			 ADC_CS_N : OUT STD_LOGIC;
			 ADC_DIN : OUT STD_LOGIC;
			 CH0 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			 CH1 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			 CH2 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			 CH3 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			 CH4 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			 CH5 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			 CH6 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
			 CH7 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT lpm_compare0
		PORT(dataa : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			 aleb : OUT STD_LOGIC
		);
	END COMPONENT;

		SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
		SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
		SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
		SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
		SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(11 DOWNTO 0);
		SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(11 DOWNTO 0);
		SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;


	BEGIN 
	Hab_D <= SYNTHESIZED_WIRE_8;
	Hab_I <= SYNTHESIZED_WIRE_8;
	c1 <= SYNTHESIZED_WIRE_4;
	CH0 <= SYNTHESIZED_WIRE_6;
	CH1 <= SYNTHESIZED_WIRE_7;



	b2v_inst : pll
	PORT MAP(inclk0 => clk,
			 areset => SYNTHESIZED_WIRE_9,
			 c0 => SYNTHESIZED_WIRE_8,
			 c1 => SYNTHESIZED_WIRE_4);


	b2v_inst1 : avancefijo
	PORT MAP(reset => SYNTHESIZED_WIRE_9,
			 clock => clk,
			 SI => SYNTHESIZED_WIRE_2,
			 SD => SYNTHESIZED_WIRE_3,
			 M0D => M0D,
			 M1D => M1D,
			 M0I => M0I,
			 M1I => M1I);


	b2v_inst2 : adc
	PORT MAP(CLOCK => SYNTHESIZED_WIRE_4,
			 ADC_DOUT => ADC_DOUT,
			 RESET => SYNTHESIZED_WIRE_9,
			 ADC_SCLK => ADC_SCLK,
			 ADC_CS_N => ADC_CS_N,
			 ADC_DIN => ADC_DIN,
			 CH0 => SYNTHESIZED_WIRE_6,
			 CH1 => SYNTHESIZED_WIRE_7,
			 CH2 => CH2,
			 CH3 => CH3,
			 CH4 => CH4,
			 CH5 => CH5,
			 CH6 => CH6,
			 CH7 => CH7);


	SYNTHESIZED_WIRE_9 <= NOT(reset);



	b2v_inst7 : lpm_compare0
	PORT MAP(dataa => SYNTHESIZED_WIRE_6,
			 aleb => SYNTHESIZED_WIRE_3);


	b2v_inst8 : lpm_compare0
	PORT MAP(dataa => SYNTHESIZED_WIRE_7,
			 aleb => SYNTHESIZED_WIRE_2);


END bdf_type;