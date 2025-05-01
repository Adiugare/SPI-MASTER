module spi_tb;
    reg clk, reset, mosi;
    wire miso, sclk, cs;

    // Instantiate SPI Master Module
    spi_master uut (
        .clk(clk),
        .reset(reset),   // Ensure matching name
        .mosi_data(mosi),
        .miso_data(miso),
        .sclk(sclk),
        .cs(cs)
    );

    // Generate clock signal (Toggles every 5 time units)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0; reset = 1; #10;   // Activate reset
        reset = 0; mosi = 1; #50;  // Send data: 1
        mosi = 0; #50;             // Send data: 0
        $finish;                   // End simulation
    end
endmodule
