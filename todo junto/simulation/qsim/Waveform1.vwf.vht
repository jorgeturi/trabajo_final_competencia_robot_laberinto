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
-- Generated on "11/22/2024 18:17:39"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ubicacion2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ubicacion2_vhd_vec_tst IS
END ubicacion2_vhd_vec_tst;
ARCHITECTURE ubicacion2_arch OF ubicacion2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL E : STD_LOGIC;
SIGNAL orientacion_out : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL posicion_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL SD : STD_LOGIC;
SIGNAL SF : STD_LOGIC;
SIGNAL SI : STD_LOGIC;
SIGNAL SL : STD_LOGIC;
SIGNAL x : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT ubicacion2
	PORT (
	E : IN STD_LOGIC;
	orientacion_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	posicion_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	reset : IN STD_LOGIC;
	SD : IN STD_LOGIC;
	SF : IN STD_LOGIC;
	SI : IN STD_LOGIC;
	SL : IN STD_LOGIC;
	x : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ubicacion2
	PORT MAP (
-- list connections between master ports and signals
	E => E,
	orientacion_out => orientacion_out,
	posicion_out => posicion_out,
	reset => reset,
	SD => SD,
	SF => SF,
	SI => SI,
	SL => SL,
	x => x
	);

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
	WAIT FOR 6080000 ps;
	x(1) <= '1';
	WAIT FOR 12000000 ps;
	x(1) <= '0';
	WAIT FOR 17920000 ps;
	x(1) <= '1';
	WAIT FOR 12000000 ps;
	FOR i IN 1 TO 2
	LOOP
		x(1) <= '0';
		WAIT FOR 12000000 ps;
		x(1) <= '1';
		WAIT FOR 12000000 ps;
	END LOOP;
	x(1) <= '0';
WAIT;
END PROCESS t_prcs_x_1;
-- x[0]
t_prcs_x_0: PROCESS
BEGIN
	x(0) <= '0';
	WAIT FOR 6000000 ps;
	x(0) <= '1';
	WAIT FOR 80000 ps;
	x(0) <= '0';
	WAIT FOR 6080000 ps;
	x(0) <= '1';
	WAIT FOR 5760000 ps;
	x(0) <= '0';
	WAIT FOR 80000 ps;
	x(0) <= '1';
	WAIT FOR 6000000 ps;
	x(0) <= '0';
	WAIT FOR 6000000 ps;
	x(0) <= '1';
	WAIT FOR 6000000 ps;
	FOR i IN 1 TO 5
	LOOP
		x(0) <= '0';
		WAIT FOR 6000000 ps;
		x(0) <= '1';
		WAIT FOR 6000000 ps;
	END LOOP;
	x(0) <= '0';
WAIT;
END PROCESS t_prcs_x_0;
END ubicacion2_arch;
