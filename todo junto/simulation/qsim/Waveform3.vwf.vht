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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/28/2024 16:50:59"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ubicacion3
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ubicacion3_vhd_vec_tst IS
END ubicacion3_vhd_vec_tst;
ARCHITECTURE ubicacion3_arch OF ubicacion3_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ADC_CS_N : STD_LOGIC;
SIGNAL ADC_DIN : STD_LOGIC;
SIGNAL ADC_DOUT : STD_LOGIC;
SIGNAL ADC_SCLK : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL E : STD_LOGIC;
SIGNAL E_delay2_out : STD_LOGIC;
SIGNAL E_delay_out : STD_LOGIC;
SIGNAL orientacion_out : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL posicion_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL SF : STD_LOGIC;
SIGNAL SL : STD_LOGIC;
SIGNAL x : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT ubicacion3
	PORT (
	ADC_CS_N : OUT STD_LOGIC;
	ADC_DIN : OUT STD_LOGIC;
	ADC_DOUT : IN STD_LOGIC;
	ADC_SCLK : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	E : IN STD_LOGIC;
	E_delay2_out : OUT STD_LOGIC;
	E_delay_out : OUT STD_LOGIC;
	orientacion_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	posicion_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	reset : IN STD_LOGIC;
	SF : IN STD_LOGIC;
	SL : IN STD_LOGIC;
	x : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ubicacion3
	PORT MAP (
-- list connections between master ports and signals
	ADC_CS_N => ADC_CS_N,
	ADC_DIN => ADC_DIN,
	ADC_DOUT => ADC_DOUT,
	ADC_SCLK => ADC_SCLK,
	clk => clk,
	E => E,
	E_delay2_out => E_delay2_out,
	E_delay_out => E_delay_out,
	orientacion_out => orientacion_out,
	posicion_out => posicion_out,
	reset => reset,
	SF => SF,
	SL => SL,
	x => x
	);

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 500 ps;
	clk <= '1';
	WAIT FOR 500 ps;
	IF (NOW >= 100000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- E
t_prcs_E: PROCESS
BEGIN
LOOP
	E <= '0';
	WAIT FOR 1000000 ps;
	E <= '1';
	WAIT FOR 1000000 ps;
	IF (NOW >= 100000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_E;
-- x[1]
t_prcs_x_1: PROCESS
BEGIN
	x(1) <= '0';
	WAIT FOR 6720000 ps;
	x(1) <= '1';
	WAIT FOR 1920000 ps;
	x(1) <= '0';
	WAIT FOR 4000000 ps;
	x(1) <= '1';
	WAIT FOR 1760000 ps;
	x(1) <= '0';
	WAIT FOR 4320000 ps;
	x(1) <= '1';
	WAIT FOR 1600000 ps;
	x(1) <= '0';
WAIT;
END PROCESS t_prcs_x_1;
-- x[0]
t_prcs_x_0: PROCESS
BEGIN
	x(0) <= '0';
WAIT;
END PROCESS t_prcs_x_0;
END ubicacion3_arch;
