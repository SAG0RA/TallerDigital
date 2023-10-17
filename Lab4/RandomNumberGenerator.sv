module RandomNumberGenerator (
  input wire clk,
  input wire reset,
  output wire [2:0] A,
  output wire [2:0] B,
  output wire [2:0] C
);
  reg [2:0] seed = 3'b010; // Inicialización con 2 (equivalente al valor inicial en VHDL)

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      seed <= 3'b010; // Restablecer la semilla a 2 (equivalente al valor inicial en VHDL)
    end else begin
      // Algoritmo LCG
      seed <= (seed * 3'b101 + 3'b011) % 3'b1000;
    end
  end

  assign A = seed;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      seed <= 3'b010; // Restablecer la semilla a 2 (equivalente al valor inicial en VHDL)
    end else begin
      // Algoritmo LCG
      seed <= (seed * 3'b101 + 3'b011) % 3'b1000;
    end
  end

  assign B = seed;

  always @* begin
    C = A + B;
  end
endmodule
