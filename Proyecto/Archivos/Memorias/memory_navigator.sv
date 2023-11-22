module memory_navigator (
    input logic clk, rst,
    input logic [3:0] switch,
    output logic [31:0] address
);

    // Variable para almacenar la dirección actual
    logic [31:0] current_address;

    always_ff @(posedge clk or posedge rst)
        if (rst) begin
            current_address <= 0;
        end
        else if (switch != 4'b1111) begin
            current_address <= current_address + 1; // Incrementar la dirección al pulsar el botón
        end

    assign address = current_address;

endmodule
