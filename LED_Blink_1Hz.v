//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2025 03:15:23 PM
// Design Name: 
// Module Name: LED_Blink_1Hz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LED_Blink_1Hz(
    input clk,  // clock input
    input rst_btn, // reset button
    output LED  // LED output
    );
    parameter half_freq = 62_500_000; // Half of the clock frequency (125MHZ).
    parameter W = 26; // Ceiling value of log with base 2 of half_freq.
    reg led_mode; // Toggles every 62500000 clock cycles
    reg [W-1:0] counter; // Counts up to 62500000
    reg rst_s1, rst_s2;  // 2 flip-flops to make a 2-FF synchronizer for the reset.
    always @(posedge clk or posedge rst_btn) begin  // We need to synchronize de-assertion to avoid metastability risk. 
        if (rst_btn) begin
            rst_s1 <= 1'b1;
            rst_s2 <= 1'b1;
        end else begin
            rst_s1 <= 1'b0;
            rst_s2 <= rst_s1; // Waits an extra clock cycle before being de-asserted, protecting the rest of the circuit in case the first flop enters into a metastable state.
        end
    end
    wire rst = rst_s2;  // active-high, synchronous inside this clock domain
    always@(posedge clk) begin
        if(rst) begin // Reset counter and turn LED off in the case reset was asserted.
            led_mode <=1'b0;
            counter <={W{1'b0}};
        end
        else if(counter == (half_freq-1)) begin // In the case that we are at our 62500000th cycle (corresponding to counter == 62499999).
            led_mode<= ~led_mode;// Toggle the LED on/off (50/50 duty cycle).
            counter <=1'b0; //Restart the count
        end
        else counter <= counter + 1'b1; //Increment the count in other cases.
    end
    assign LED = led_mode; // Continuous assignment of LED.
endmodule
