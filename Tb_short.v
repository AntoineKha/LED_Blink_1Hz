module Tb_short;
    
    reg clk;
    reg rst_btn;
    wire LED;
    
    // The parameters from the design source file (LED_Blink_1Hz.v) are being overwritten here for simulation purposes.
    // This gives the advantage of having a shorter simulation to verify the functioning of the design.

    LED_Blink_1Hz #(.half_freq(10), .W(4)) uut (    
        .clk(clk),
        .rst_btn(rst_btn),
        .LED(LED)
    );
    
    always #4 clk = ~clk;
    
    initial begin
        clk = 0;
        rst_btn = 0;
        
        #100;
        rst_btn = 1;
        #100;
        rst_btn = 0;
        
        // End the simulation at 1200 ns.
        #1000;
        
        $finish;
    end
    
endmodule
