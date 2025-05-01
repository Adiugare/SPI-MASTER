module spi_master (
    input wire clk,         // System clock
    input wire reset,       // Reset signal
    input wire mosi_data,   // Data to send from Master to Slave
    output reg miso_data,   // Data received from Slave to Master
    output reg sclk,        // SPI clock
    output reg cs           // Chip select
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        sclk <= 0;  // Reset SPI clock
        cs <= 1;    // Chip select HIGH (inactive)
    end else begin
        sclk <= ~sclk; // Toggle SPI clock
        cs <= 0;       // Activate chip select
        miso_data <= mosi_data; // Simple loopback for testing
    end
end

endmodule
