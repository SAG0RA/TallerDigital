module tb_matriz_bombas;

  integer tablero [7:0][7:0]; // Declaración de la matriz tablero
  bit m_bombas [7:0][7:0]; // Declaración de la matriz m_bombas
  integer m_perimetro [7:0][7:0]; // Declaración de la matriz m_perimetro
  integer num_bombas = 10; // Inicializar num_bombas en 10
  integer i, j; // Variables de control
  integer casillas_libres; // Variable para almacenar el número de casillas libres

  // Instanciar el módulo matriz_bombas
  matriz_bombas matriz_bombas_inst (
    .m_bombas(m_bombas), // Conectar la matriz m_bombas
    .m_perimetro(m_perimetro), // Conectar la matriz m_perimetro
	 .casillas_libres(casillas_libres) // Conectar la salida de casillas_libres
  );

  initial begin
    // Inicializar el tablero
    matriz_bombas_inst.crear_tablero(tablero);
	 
    // Llamamos a la función insertar_bombas y pasamos num_bombas como argumento
    matriz_bombas_inst.insertar_bombas(m_bombas, num_bombas);

    // Llamamos a la función bombas_encontradas
    matriz_bombas_inst.bombas_encontradas(m_bombas, m_perimetro);
	 
	     // Llamamos a la función cantidad_libres para calcular el número de casillas libres
    matriz_bombas_inst.cantidad_libres(num_bombas, casillas_libres);

    // Mostrar la matriz tablero
    $display("Matriz tablero:");
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        $write("%d ", tablero[i][j]);
      end
      $display(""); // Cambiar de línea para la siguiente fila
    end

    // Mostrar la matriz m_bombas
    $display("Matriz m_bombas:");
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        $write("%b ", m_bombas[i][j]);
      end
      $display(""); // Cambiar de línea para la siguiente fila
    end

    // Mostrar la matriz m_perimetro
    $display("Matriz m_perimetro:");
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        $write("%d ", m_perimetro[i][j]);
      end
      $display(""); // Cambiar de línea para la siguiente fila
    end
	 
	     // Mostrar el número de casillas libres
    $display("Número de casillas libres: %d", casillas_libres);

    // Finalizar la simulación
    $finish;
  end
endmodule

