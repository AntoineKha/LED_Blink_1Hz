set_property -dict { PACKAGE_PIN R14 IOSTANDARD LVCMOS33 } [get_ports {LED}] # R14 corresponds to the LED_D0 pin on the PYNQ-Z2 board.
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports {clk}] # H16 pin corresponds to the external 125MHZ clock on the PYNQ board.
create_clock -period 8.000 -name pl_clk_125 [get_ports {clk}] #To tell Vivado that our clock is 125MHZ, helps prevent inaccuracies for STA.
set_property -dict { PACKAGE_PIN D19 IOSTANDARD LVCMOS33 } [get_ports {rst_btn}] # D19 corresponds to the BTN0 button on the PYNQ board.
set_property PULLDOWN true [get_ports {rst_btn}] #Avoids floating inputs by allowing the FPGA'S internal pull-down resistor to bias the reset signal to 0 when the button is not pressed.