Board: PYNQ-Z2 board (Reference Manual: https://www.mouser.com/datasheet/2/744/pynqz2_user_manual_v1_0-1525725.pdf?srsltid=AfmBOoqk5-8LT7F52Ry-4KfCHXp83HQxF6D7Pa_9FUb6yfxQHbM59Zvn).
Clock: External PL 125 MHz (pin H16).
LED: LED0 (pin R14)  
Reset: BTN0 (pin D19), active-high, asynchronous

Background: This implementation leverages the clock cycles to accurately reach 1 HZ, and since our clock can divide 1 HZ into a clean integer value of clock cycles (in our case 125 million clock cycles), 
this implementation has the lowest possible error. Our error is limited to the oscillator precision, temperature, and more factors beyond the design.
The R14 and D19 pins correspond to a LED and a button. We use the LED as our visual output and the button as our asynchronous reset.
A synchronizer has been made with 2 flip flops to avoid deassertion metastability risk.
We use our XDC file to set the appropriate pins to our logical ports for the bitstream generation, and we set the clock period for the timing tool. Without it, bitstream generation would give an error.
The H16 pin on the Pynq-Z2 board corresponds to an external clock pin from the Ethernet PHY. We are using this clock for convenience since we avoid making a block design and configuring the PS-generated clocks. 
For this design, we don't have to worry about the PHY getting reset.
