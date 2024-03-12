#LEDs

set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33} [get_ports {LEDS[0]}]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {LEDS[1]}]
set_property -dict {PACKAGE_PIN M15 IOSTANDARD LVCMOS33} [get_ports {LEDS[2]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {LEDS[3]}]

##Buttons

set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {BUTTONS[0]}]
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports {BUTTONS[1]}]
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {BUTTONS[2]}]
set_property -dict {PACKAGE_PIN N15 IOSTANDARD LVCMOS33} [get_ports {BUTTONS[3]}]

## Clock signal 125 MHz

set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { CLK_125MHZ_FPGA }];
create_clock -add -name CLK_125MHZ_FPGA -period 8.00 -waveform {0 4} [get_ports { CLK_125MHZ_FPGA }];

