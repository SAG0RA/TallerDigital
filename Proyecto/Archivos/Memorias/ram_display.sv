module ram_display (
    input logic [31:0] ram_data,
    output logic [7:0] led_display
);

    assign led_display = ram_data[7:0]; // Conectar los primeros 8 bits a los LEDs

endmodule
