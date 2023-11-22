
module rom  #(parameter ADDR_WIDTH = 16, DATA_WIDTH = 24)(input wire clk,
				input wire [31:0] address,
				output logic [31:0] data_out);
				
	
	// Variables requeridas
  	reg [31:0] memory [9999:0];

	// Función para cargar los datos de la memoria
	function void load_memory;
		$readmemh("C:/Users/saulg/Downloads/Proyecto temp - pruebas/Archivos/Obtener imagen/datos_imagen_hex.txt", memory);
		
	endfunction
	
	initial begin
		load_memory();
	end

	
	always @(posedge clk) begin
		data_out <= memory[address];
	end
	
endmodule
