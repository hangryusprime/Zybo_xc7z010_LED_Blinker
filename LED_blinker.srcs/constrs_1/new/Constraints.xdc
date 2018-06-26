# Clock 125MHz - L16
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN L16 [get_ports clk]

# Reset - R18
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN R18 [get_ports reset]

# Pause - G15
set_property IOSTANDARD LVCMOS33 [get_ports pause]
set_property PACKAGE_PIN G15 [get_ports pause]

# select mode(3-bit) - 0-P15, 1-W13, 2-T16
set_property IOSTANDARD LVCMOS33 [get_ports {select[0]}]
set_property PACKAGE_PIN P15 [get_ports {select[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {select[1]}]
set_property PACKAGE_PIN W13 [get_ports {select[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {select[2]}]
set_property PACKAGE_PIN T16 [get_ports {select[2]}]

# LED - 0-M14, 1-M15, 2-G14, 3-D18.
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN M14 [get_ports {led[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN M15 [get_ports {led[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN G14 [get_ports {led[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN D18 [get_ports {led[3]}]