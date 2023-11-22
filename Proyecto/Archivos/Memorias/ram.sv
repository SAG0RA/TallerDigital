
module ram (
    input logic clk, we,
    input logic [31:0] address, wd,
    output logic [31:0] rd,
    output logic [7:0] led_display
);

    // Variables requeridas
    logic [31:0] RAM[9999:0];

    // Instancia de la visualización
    ram_display display_inst (
        .ram_data(RAM[address]),
        .led_display(led_display)
    );

    always_ff @(posedge clk)
        if (we) begin
            RAM[address] <= wd;
        end
        else begin
            rd = RAM[address];
        end

endmodule
