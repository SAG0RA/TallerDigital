module rom_tb;
    // Parámetros de configuración del testbench
    localparam ADDR_WIDTH = 16;
    localparam DATA_WIDTH = 24;

    // Señales de entrada del testbench
    reg clk;
    reg [31:0] address;  // Update size to 32 bits

    // Señales de salida del testbench
    logic [31:0] data_out;  // Update size to 32 bits

    // Instancia del módulo ROM bajo prueba
    rom #(ADDR_WIDTH, DATA_WIDTH) dut (
        .clk(clk),
        .address(address),
        .data_out(data_out)
    );

    reg [31:0] data_out_array [0:9999];  // Arreglo para almacenar los valores de data_out

    // Generación de un clock
    always #5 clk = ~clk;

    // Inicialización de las señales
    initial begin
        clk = 0;
    end

    always @(negedge clk) begin
        if (address >= 0 && address <= 9999) begin
            data_out_array[address] = data_out;
            address += 16'b1;
        end
        else begin
            address = 0;
        end
    end

endmodule

