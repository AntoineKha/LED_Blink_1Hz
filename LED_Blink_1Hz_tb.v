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
    always #4 clk = ~clk;
    
    // Run the test
    initial begin
        clk = 0;
        rst_btn = 0;
        
      // Reset assertion so that our count can begin.
        #100;
        rst_btn = 1;
        #100;
        rst_btn = 0;
        
      // We will run it for 0.505s, can be ommitted in the case where simulation time is controlled by settings (Like in Vivado). 
      // #505_000_000
    end
    
endmodule
