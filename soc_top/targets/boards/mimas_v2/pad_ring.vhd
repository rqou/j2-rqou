-- Copyright (c) 2015, Smart Energy Instruments Inc.
-- All rights reserved.  For details, see COPYING in the top level directory.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.config.all;
use work.cpu2j0_pack.all;
use work.data_bus_pack.all;
use work.ddr_pack.all;
library unisim;
use unisim.vcomponents.all;
entity pad_ring is
    port (
        pin_clk_100mhz : in std_logic;
        pin_led0 : out std_logic;
        pin_led1 : out std_logic;
        pin_led2 : out std_logic;
        pin_led3 : out std_logic;
        pin_led4 : out std_logic;
        pin_led5 : out std_logic;
        pin_led6 : out std_logic;
        pin_led7 : out std_logic;
        pin_mcb3_dram_a0 : out std_logic;
        pin_mcb3_dram_a1 : out std_logic;
        pin_mcb3_dram_a10 : out std_logic;
        pin_mcb3_dram_a11 : out std_logic;
        pin_mcb3_dram_a12 : out std_logic;
        pin_mcb3_dram_a2 : out std_logic;
        pin_mcb3_dram_a3 : out std_logic;
        pin_mcb3_dram_a4 : out std_logic;
        pin_mcb3_dram_a5 : out std_logic;
        pin_mcb3_dram_a6 : out std_logic;
        pin_mcb3_dram_a7 : out std_logic;
        pin_mcb3_dram_a8 : out std_logic;
        pin_mcb3_dram_a9 : out std_logic;
        pin_mcb3_dram_ba0 : out std_logic;
        pin_mcb3_dram_ba1 : out std_logic;
        pin_mcb3_dram_cas_n : out std_logic;
        pin_mcb3_dram_ck : out std_logic;
        pin_mcb3_dram_ck_n : out std_logic;
        pin_mcb3_dram_cke : out std_logic;
        pin_mcb3_dram_dq0 : inout std_logic;
        pin_mcb3_dram_dq1 : inout std_logic;
        pin_mcb3_dram_dq10 : inout std_logic;
        pin_mcb3_dram_dq11 : inout std_logic;
        pin_mcb3_dram_dq12 : inout std_logic;
        pin_mcb3_dram_dq13 : inout std_logic;
        pin_mcb3_dram_dq14 : inout std_logic;
        pin_mcb3_dram_dq15 : inout std_logic;
        pin_mcb3_dram_dq2 : inout std_logic;
        pin_mcb3_dram_dq3 : inout std_logic;
        pin_mcb3_dram_dq4 : inout std_logic;
        pin_mcb3_dram_dq5 : inout std_logic;
        pin_mcb3_dram_dq6 : inout std_logic;
        pin_mcb3_dram_dq7 : inout std_logic;
        pin_mcb3_dram_dq8 : inout std_logic;
        pin_mcb3_dram_dq9 : inout std_logic;
        pin_mcb3_dram_ldm : out std_logic;
        pin_mcb3_dram_ldqs : inout std_logic;
        pin_mcb3_dram_ras_n : out std_logic;
        pin_mcb3_dram_udm : out std_logic;
        pin_mcb3_dram_udqs : inout std_logic;
        pin_mcb3_dram_we_n : out std_logic;
        pin_sd_clk : out std_logic;
        pin_sd_cs : out std_logic;
        pin_sd_miso : in std_logic;
        pin_sd_mosi : out std_logic;
        pin_sevensegment0 : out std_logic;
        pin_sevensegment1 : out std_logic;
        pin_sevensegment2 : out std_logic;
        pin_sevensegment3 : out std_logic;
        pin_sevensegment4 : out std_logic;
        pin_sevensegment5 : out std_logic;
        pin_sevensegment6 : out std_logic;
        pin_sevensegment7 : out std_logic;
        pin_sevensegmentenable0 : out std_logic;
        pin_sevensegmentenable1 : out std_logic;
        pin_sevensegmentenable2 : out std_logic;
        pin_spi_cs : out std_logic;
        pin_uart_rx : out std_logic;
        pin_uart_tx : in std_logic
    );
end;
architecture impl of pad_ring is
    attribute loc : string;
    -- Pin attributes
    attribute loc of pin_clk_100mhz          : signal is "v10";
    attribute loc of pin_led0                : signal is "t18";
    attribute loc of pin_led1                : signal is "t17";
    attribute loc of pin_led2                : signal is "u18";
    attribute loc of pin_led3                : signal is "u17";
    attribute loc of pin_led4                : signal is "n16";
    attribute loc of pin_led5                : signal is "n15";
    attribute loc of pin_led6                : signal is "p16";
    attribute loc of pin_led7                : signal is "p15";
    attribute loc of pin_mcb3_dram_a0        : signal is "j7";
    attribute loc of pin_mcb3_dram_a1        : signal is "j6";
    attribute loc of pin_mcb3_dram_a10       : signal is "f4";
    attribute loc of pin_mcb3_dram_a11       : signal is "d3";
    attribute loc of pin_mcb3_dram_a12       : signal is "g6";
    attribute loc of pin_mcb3_dram_a2        : signal is "h5";
    attribute loc of pin_mcb3_dram_a3        : signal is "l7";
    attribute loc of pin_mcb3_dram_a4        : signal is "f3";
    attribute loc of pin_mcb3_dram_a5        : signal is "h4";
    attribute loc of pin_mcb3_dram_a6        : signal is "h3";
    attribute loc of pin_mcb3_dram_a7        : signal is "h6";
    attribute loc of pin_mcb3_dram_a8        : signal is "d2";
    attribute loc of pin_mcb3_dram_a9        : signal is "d1";
    attribute loc of pin_mcb3_dram_ba0       : signal is "f2";
    attribute loc of pin_mcb3_dram_ba1       : signal is "f1";
    attribute loc of pin_mcb3_dram_cas_n     : signal is "k5";
    attribute loc of pin_mcb3_dram_ck        : signal is "g3";
    attribute loc of pin_mcb3_dram_ck_n      : signal is "g1";
    attribute loc of pin_mcb3_dram_cke       : signal is "h7";
    attribute loc of pin_mcb3_dram_dq0       : signal is "l2";
    attribute loc of pin_mcb3_dram_dq1       : signal is "l1";
    attribute loc of pin_mcb3_dram_dq10      : signal is "n2";
    attribute loc of pin_mcb3_dram_dq11      : signal is "n1";
    attribute loc of pin_mcb3_dram_dq12      : signal is "t2";
    attribute loc of pin_mcb3_dram_dq13      : signal is "t1";
    attribute loc of pin_mcb3_dram_dq14      : signal is "u2";
    attribute loc of pin_mcb3_dram_dq15      : signal is "u1";
    attribute loc of pin_mcb3_dram_dq2       : signal is "k2";
    attribute loc of pin_mcb3_dram_dq3       : signal is "k1";
    attribute loc of pin_mcb3_dram_dq4       : signal is "h2";
    attribute loc of pin_mcb3_dram_dq5       : signal is "h1";
    attribute loc of pin_mcb3_dram_dq6       : signal is "j3";
    attribute loc of pin_mcb3_dram_dq7       : signal is "j1";
    attribute loc of pin_mcb3_dram_dq8       : signal is "m3";
    attribute loc of pin_mcb3_dram_dq9       : signal is "m1";
    attribute loc of pin_mcb3_dram_ldm       : signal is "k3";
    attribute loc of pin_mcb3_dram_ldqs      : signal is "l4";
    attribute loc of pin_mcb3_dram_ras_n     : signal is "l5";
    attribute loc of pin_mcb3_dram_udm       : signal is "k4";
    attribute loc of pin_mcb3_dram_udqs      : signal is "p2";
    attribute loc of pin_mcb3_dram_we_n      : signal is "e3";
    attribute loc of pin_sd_clk              : signal is "l12";
    attribute loc of pin_sd_cs               : signal is "l13";
    attribute loc of pin_sd_miso             : signal is "k14";
    attribute loc of pin_sd_mosi             : signal is "g16";
    attribute loc of pin_sevensegment0       : signal is "a5";
    attribute loc of pin_sevensegment1       : signal is "c6";
    attribute loc of pin_sevensegment2       : signal is "d6";
    attribute loc of pin_sevensegment3       : signal is "c5";
    attribute loc of pin_sevensegment4       : signal is "c4";
    attribute loc of pin_sevensegment5       : signal is "a4";
    attribute loc of pin_sevensegment6       : signal is "b4";
    attribute loc of pin_sevensegment7       : signal is "a3";
    attribute loc of pin_sevensegmentenable0 : signal is "b2";
    attribute loc of pin_sevensegmentenable1 : signal is "a2";
    attribute loc of pin_sevensegmentenable2 : signal is "b3";
    attribute loc of pin_spi_cs              : signal is "v3";
    attribute loc of pin_uart_rx             : signal is "b8";
    attribute loc of pin_uart_tx             : signal is "a8";
    signal clk31_todcm : std_logic;
    signal clk_100mhz : std_logic;
    signal clk_sys : std_logic;
    signal clk_sys2x : std_logic;
    signal clk_sys_90 : std_logic;
    signal clock_locked : std_logic;
    signal ddr_clk : std_logic;
    signal ddr_sd_ctrl : sd_ctrl_t;
    signal ddr_sd_data_i : sd_data_i_t;
    signal ddr_sd_data_o : sd_data_o_t;
    signal dr_data_i : dr_data_i_t;
    signal dr_data_o : dr_data_o_t;
    signal pi : std_logic_vector(31 downto 0);
    signal pll_rst : std_logic;
    signal po : std_logic_vector(31 downto 0);
    signal reset : std_logic;
    signal spi_clk : std_logic;
    signal spi_cs : std_logic_vector(1 downto 0);
    signal spi_miso : std_logic;
    signal spi_mosi : std_logic;
    signal uart_rx : std_logic;
    signal uart_tx : std_logic;
begin
    soc : entity work.soc(impl)
        port map (
            clk_sys => clk_sys,
            clk_sys2x => clk_sys2x,
            clk_sys_90 => clk_sys_90,
            clock_locked => clock_locked,
            ddr_sd_ctrl => ddr_sd_ctrl,
            ddr_sd_data_i => ddr_sd_data_i,
            ddr_sd_data_o => ddr_sd_data_o,
            pi => pi,
            po => po,
            reset => reset,
            spi_clk => spi_clk,
            spi_cs => spi_cs,
            spi_miso => spi_miso,
            spi_mosi => spi_mosi,
            uart_rx => uart_rx,
            uart_tx => uart_tx
        );
    ddr_clkgen : entity work.ddr_clkgen(interface)
        port map (
            clk0_o => clk_sys,
            clk125_o => open,
            clk180_o => open,
            clk2x_o => clk_sys2x,
            clk90_o => clk_sys_90,
            clk_i => clk31_todcm,
            locked => clock_locked,
            reset_i => pll_rst
        );
    ddr_iocells : entity work.ddr_iocells(interface)
        port map (
            ckpo => ddr_clk,
            ddr_clk0 => clk_sys,
            ddr_clk90 => clk_sys_90,
            dr_data_i => dr_data_i,
            dr_data_o => dr_data_o,
            reset => reset,
            sd_data_i => ddr_sd_data_i,
            sd_data_o => ddr_sd_data_o
        );
    pll_250 : entity work.pll_250(xilinx)
        port map (
            clk => clk_100mhz,
            clk250 => open,
            clk31 => clk31_todcm,
            clk_0 => open,
            clk_180 => open,
            clk_270 => open,
            clk_90 => open,
            locked => open,
            reset_o => pll_rst
        );
    reset_gen : entity work.reset_gen(arch)
        port map (
            clock_locked => clock_locked,
            reset => reset
        );
    -- led
    pi(0) <= po(0);
    -- led
    pi(1) <= po(1);
    -- led
    pi(2) <= po(2);
    -- led
    pi(3) <= po(3);
    -- led
    pi(4) <= po(4);
    -- led
    pi(5) <= po(5);
    -- led
    pi(6) <= po(6);
    -- led
    pi(7) <= po(7);
    -- sevensegment
    pi(8) <= po(8);
    -- sevensegment
    pi(9) <= po(9);
    -- sevensegment
    pi(10) <= po(10);
    -- sevensegment
    pi(11) <= po(11);
    -- sevensegment
    pi(12) <= po(12);
    -- sevensegment
    pi(13) <= po(13);
    -- sevensegment
    pi(14) <= po(14);
    -- sevensegment
    pi(15) <= po(15);
    pi(16) <= '0';
    pi(17) <= '0';
    pi(18) <= '0';
    pi(19) <= '0';
    pi(20) <= '0';
    pi(21) <= '0';
    pi(22) <= '0';
    pi(23) <= '0';
    pi(24) <= '0';
    pi(25) <= '0';
    pi(26) <= '0';
    pi(27) <= '0';
    pi(28) <= '0';
    pi(29) <= '0';
    pi(30) <= '0';
    pi(31) <= '0';
    clk_100mhz <= pin_clk_100mhz;
    obuf_led0 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(0),
            O => pin_led0
        );
    obuf_led1 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(1),
            O => pin_led1
        );
    obuf_led2 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(2),
            O => pin_led2
        );
    obuf_led3 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(3),
            O => pin_led3
        );
    obuf_led4 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(4),
            O => pin_led4
        );
    obuf_led5 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(5),
            O => pin_led5
        );
    obuf_led6 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(6),
            O => pin_led6
        );
    obuf_led7 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(7),
            O => pin_led7
        );
    obuf_mcb3_dram_a0 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(0),
            O => pin_mcb3_dram_a0
        );
    obuf_mcb3_dram_a1 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(1),
            O => pin_mcb3_dram_a1
        );
    obuf_mcb3_dram_a10 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(10),
            O => pin_mcb3_dram_a10
        );
    obuf_mcb3_dram_a11 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(11),
            O => pin_mcb3_dram_a11
        );
    obuf_mcb3_dram_a12 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(12),
            O => pin_mcb3_dram_a12
        );
    obuf_mcb3_dram_a2 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(2),
            O => pin_mcb3_dram_a2
        );
    obuf_mcb3_dram_a3 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(3),
            O => pin_mcb3_dram_a3
        );
    obuf_mcb3_dram_a4 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(4),
            O => pin_mcb3_dram_a4
        );
    obuf_mcb3_dram_a5 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(5),
            O => pin_mcb3_dram_a5
        );
    obuf_mcb3_dram_a6 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(6),
            O => pin_mcb3_dram_a6
        );
    obuf_mcb3_dram_a7 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(7),
            O => pin_mcb3_dram_a7
        );
    obuf_mcb3_dram_a8 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(8),
            O => pin_mcb3_dram_a8
        );
    obuf_mcb3_dram_a9 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.a(9),
            O => pin_mcb3_dram_a9
        );
    obuf_mcb3_dram_ba0 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.ba(0),
            O => pin_mcb3_dram_ba0
        );
    obuf_mcb3_dram_ba1 : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.ba(1),
            O => pin_mcb3_dram_ba1
        );
    obuf_mcb3_dram_cas_n : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.cas,
            O => pin_mcb3_dram_cas_n
        );
    obuf_mcb3_dram_cke : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.cke,
            O => pin_mcb3_dram_cke
        );
    iobuf_mcb3_dram_dq0 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(0),
            T => dr_data_o.dq_outen(0),
            O => dr_data_i.dqi(0),
            IO => pin_mcb3_dram_dq0
        );
    iobuf_mcb3_dram_dq1 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(1),
            T => dr_data_o.dq_outen(1),
            O => dr_data_i.dqi(1),
            IO => pin_mcb3_dram_dq1
        );
    iobuf_mcb3_dram_dq10 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(10),
            T => dr_data_o.dq_outen(10),
            O => dr_data_i.dqi(10),
            IO => pin_mcb3_dram_dq10
        );
    iobuf_mcb3_dram_dq11 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(11),
            T => dr_data_o.dq_outen(11),
            O => dr_data_i.dqi(11),
            IO => pin_mcb3_dram_dq11
        );
    iobuf_mcb3_dram_dq12 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(12),
            T => dr_data_o.dq_outen(12),
            O => dr_data_i.dqi(12),
            IO => pin_mcb3_dram_dq12
        );
    iobuf_mcb3_dram_dq13 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(13),
            T => dr_data_o.dq_outen(13),
            O => dr_data_i.dqi(13),
            IO => pin_mcb3_dram_dq13
        );
    iobuf_mcb3_dram_dq14 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(14),
            T => dr_data_o.dq_outen(14),
            O => dr_data_i.dqi(14),
            IO => pin_mcb3_dram_dq14
        );
    iobuf_mcb3_dram_dq15 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(15),
            T => dr_data_o.dq_outen(15),
            O => dr_data_i.dqi(15),
            IO => pin_mcb3_dram_dq15
        );
    iobuf_mcb3_dram_dq2 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(2),
            T => dr_data_o.dq_outen(2),
            O => dr_data_i.dqi(2),
            IO => pin_mcb3_dram_dq2
        );
    iobuf_mcb3_dram_dq3 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(3),
            T => dr_data_o.dq_outen(3),
            O => dr_data_i.dqi(3),
            IO => pin_mcb3_dram_dq3
        );
    iobuf_mcb3_dram_dq4 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(4),
            T => dr_data_o.dq_outen(4),
            O => dr_data_i.dqi(4),
            IO => pin_mcb3_dram_dq4
        );
    iobuf_mcb3_dram_dq5 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(5),
            T => dr_data_o.dq_outen(5),
            O => dr_data_i.dqi(5),
            IO => pin_mcb3_dram_dq5
        );
    iobuf_mcb3_dram_dq6 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(6),
            T => dr_data_o.dq_outen(6),
            O => dr_data_i.dqi(6),
            IO => pin_mcb3_dram_dq6
        );
    iobuf_mcb3_dram_dq7 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(7),
            T => dr_data_o.dq_outen(7),
            O => dr_data_i.dqi(7),
            IO => pin_mcb3_dram_dq7
        );
    iobuf_mcb3_dram_dq8 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(8),
            T => dr_data_o.dq_outen(8),
            O => dr_data_i.dqi(8),
            IO => pin_mcb3_dram_dq8
        );
    iobuf_mcb3_dram_dq9 : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqo(9),
            T => dr_data_o.dq_outen(9),
            O => dr_data_i.dqi(9),
            IO => pin_mcb3_dram_dq9
        );
    obuft_mcb3_dram_ldm : OBUFT
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dmo(0),
            T => dr_data_o.dq_outen(16),
            O => pin_mcb3_dram_ldm
        );
    iobuf_mcb3_dram_ldqs : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqso(0),
            T => dr_data_o.dqs_outen(0),
            O => dr_data_i.dqsi(0),
            IO => pin_mcb3_dram_ldqs
        );
    obuf_mcb3_dram_ras_n : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.ras,
            O => pin_mcb3_dram_ras_n
        );
    obuft_mcb3_dram_udm : OBUFT
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dmo(1),
            T => dr_data_o.dq_outen(17),
            O => pin_mcb3_dram_udm
        );
    iobuf_mcb3_dram_udqs : IOBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => dr_data_o.dqso(1),
            T => dr_data_o.dqs_outen(1),
            O => dr_data_i.dqsi(1),
            IO => pin_mcb3_dram_udqs
        );
    obuf_mcb3_dram_we_n : OBUF
        generic map (
            IOSTANDARD => "MOBILE_DDR"
        )
        port map (
            I => ddr_sd_ctrl.we,
            O => pin_mcb3_dram_we_n
        );
    obuf_sd_clk : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => spi_clk,
            O => pin_sd_clk
        );
    obuf_sd_cs : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => spi_cs(0),
            O => pin_sd_cs
        );
    ibuf_sd_miso : IBUF
        generic map (
            IOSTANDARD => "LVCMOS33"
        )
        port map (
            I => pin_sd_miso,
            O => spi_miso
        );
    obuf_sd_mosi : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => spi_mosi,
            O => pin_sd_mosi
        );
    obuf_sevensegment0 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(8),
            O => pin_sevensegment0
        );
    obuf_sevensegment1 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(9),
            O => pin_sevensegment1
        );
    obuf_sevensegment2 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(10),
            O => pin_sevensegment2
        );
    obuf_sevensegment3 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(11),
            O => pin_sevensegment3
        );
    obuf_sevensegment4 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(12),
            O => pin_sevensegment4
        );
    obuf_sevensegment5 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(13),
            O => pin_sevensegment5
        );
    obuf_sevensegment6 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(14),
            O => pin_sevensegment6
        );
    obuf_sevensegment7 : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => po(15),
            O => pin_sevensegment7
        );
    obuf_sevensegmentenable0 : OBUF
        generic map (
            IOSTANDARD => "LVCMOS33"
        )
        port map (
            I => po(16),
            O => pin_sevensegmentenable0
        );
    obuf_sevensegmentenable1 : OBUF
        generic map (
            IOSTANDARD => "LVCMOS33"
        )
        port map (
            I => po(17),
            O => pin_sevensegmentenable1
        );
    obuf_sevensegmentenable2 : OBUF
        generic map (
            IOSTANDARD => "LVCMOS33"
        )
        port map (
            I => po(18),
            O => pin_sevensegmentenable2
        );
    obuf_spi_cs : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => '1',
            O => pin_spi_cs
        );
    obuf_uart_rx : OBUF
        generic map (
            DRIVE => 8,
            IOSTANDARD => "LVCMOS33",
            SLEW => "fast"
        )
        port map (
            I => uart_tx,
            O => pin_uart_rx
        );
    ibuf_uart_tx : IBUF
        generic map (
            IOSTANDARD => "LVCMOS33"
        )
        port map (
            I => pin_uart_tx,
            O => uart_rx
        );
    obufds_mcb3_dram_ck_mcb3_dram_ck_n : OBUFDS
        generic map (
            IOSTANDARD => "DIFF_MOBILE_DDR"
        )
        port map (
            I => ddr_clk,
            O => pin_mcb3_dram_ck,
            OB => pin_mcb3_dram_ck_n
        );
end;