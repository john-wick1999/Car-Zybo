--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Sat Jul 16 23:50:36 2022
--Host        : DESKTOP-P73GO9O running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    btns_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    direction_0_tri_io : inout STD_LOGIC_VECTOR ( 0 to 0 );
    direction_1_tri_io : inout STD_LOGIC_VECTOR ( 0 to 0 );
    driver_problem_tri_io : inout STD_LOGIC_VECTOR ( 0 to 0 );
    echo_0 : in STD_LOGIC;
    enable_driver_tri_io : inout STD_LOGIC_VECTOR ( 0 to 0 );
    pwm0 : out STD_LOGIC;
    pwm1 : out STD_LOGIC;
    rgb_led_tri_o : out STD_LOGIC_VECTOR ( 5 downto 0 );
    trigger_0 : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    pwm0 : out STD_LOGIC;
    pwm1 : out STD_LOGIC;
    trigger_0 : out STD_LOGIC;
    echo_0 : in STD_LOGIC;
    rgb_led_tri_o : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    btns_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    direction_0_tri_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    direction_0_tri_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    direction_0_tri_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    direction_1_tri_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    direction_1_tri_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    direction_1_tri_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    enable_driver_tri_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    enable_driver_tri_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    enable_driver_tri_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    driver_problem_tri_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    driver_problem_tri_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    driver_problem_tri_t : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal direction_0_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal direction_0_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal direction_0_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal direction_0_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal direction_1_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal direction_1_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal direction_1_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal direction_1_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal driver_problem_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal driver_problem_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal driver_problem_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal driver_problem_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal enable_driver_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal enable_driver_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal enable_driver_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal enable_driver_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
begin
design_1_i: component design_1
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      btns_tri_i(3 downto 0) => btns_tri_i(3 downto 0),
      direction_0_tri_i(0) => direction_0_tri_i_0(0),
      direction_0_tri_o(0) => direction_0_tri_o_0(0),
      direction_0_tri_t(0) => direction_0_tri_t_0(0),
      direction_1_tri_i(0) => direction_1_tri_i_0(0),
      direction_1_tri_o(0) => direction_1_tri_o_0(0),
      direction_1_tri_t(0) => direction_1_tri_t_0(0),
      driver_problem_tri_i(0) => driver_problem_tri_i_0(0),
      driver_problem_tri_o(0) => driver_problem_tri_o_0(0),
      driver_problem_tri_t(0) => driver_problem_tri_t_0(0),
      echo_0 => echo_0,
      enable_driver_tri_i(0) => enable_driver_tri_i_0(0),
      enable_driver_tri_o(0) => enable_driver_tri_o_0(0),
      enable_driver_tri_t(0) => enable_driver_tri_t_0(0),
      pwm0 => pwm0,
      pwm1 => pwm1,
      rgb_led_tri_o(5 downto 0) => rgb_led_tri_o(5 downto 0),
      trigger_0 => trigger_0
    );
direction_0_tri_iobuf_0: component IOBUF
     port map (
      I => direction_0_tri_o_0(0),
      IO => direction_0_tri_io(0),
      O => direction_0_tri_i_0(0),
      T => direction_0_tri_t_0(0)
    );
direction_1_tri_iobuf_0: component IOBUF
     port map (
      I => direction_1_tri_o_0(0),
      IO => direction_1_tri_io(0),
      O => direction_1_tri_i_0(0),
      T => direction_1_tri_t_0(0)
    );
driver_problem_tri_iobuf_0: component IOBUF
     port map (
      I => driver_problem_tri_o_0(0),
      IO => driver_problem_tri_io(0),
      O => driver_problem_tri_i_0(0),
      T => driver_problem_tri_t_0(0)
    );
enable_driver_tri_iobuf_0: component IOBUF
     port map (
      I => enable_driver_tri_o_0(0),
      IO => enable_driver_tri_io(0),
      O => enable_driver_tri_i_0(0),
      T => enable_driver_tri_t_0(0)
    );
end STRUCTURE;
