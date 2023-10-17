module LFSR (
   input clk,
   input rst,
   output logic [15:0] random_value
);

   // Registro de desplazamiento de retroalimentación lineal (LFSR)
   logic [15:0] lfsr = 16'b1101101001001001; // Valor inicial

   always_ff @(posedge clk or posedge rst) begin
      if (rst) begin
         lfsr <= 16'b1101101001001001; // Restablecer el LFSR al valor inicial
      end else begin
         // Lógica de retroalimentación para el LFSR
         lfsr <= {lfsr[14:0], lfsr[15] ^ lfsr[13]}; // Puedes personalizar el polinomio LFSR
      end
   end

   always_ff @(posedge clk) begin
      // Mapear el valor del LFSR a la salida
      random_value <= lfsr;
   end

endmodule
