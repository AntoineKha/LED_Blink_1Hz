`timescale 1ns / 1ps

module LED_Blink_1Hz_tb;
    
    reg clk;
    reg rst_btn;
    wire LED;
    
    // Instantiate the module
    LED_Blink_1Hz uut (
        .clk(clk),
        .rst_btn(rst_btn),
        .LED(LED)
    );
    
  // Generate the clock according to our actual period (8ns).
    always #4 clk = ~clk;    // Every 4 ns
    
    // Begin with 0 as values for reset and clock.
    initial begin    
        clk = 0;    
        rst_btn = 0;
        
      // Reset assertion so that our count can begin.
        #100;    // after 100 ns
        rst_btn = 1;
        #100;    // after another 100ns (200ns total)
        rst_btn = 0;
        
      // We will run it for 0.505s, can be ommitted in the case where simulation time is controlled by settings (Like in Vivado). 
       #505_000_000;
        $finish;
    end
    
endmodule
