module matriz_bombas (
 input int num_bombas, // Número de bombas
  output integer tablero [7:0][7:0],
  output bit m_bombas [7:0][7:0], // Declaración de la matriz m_bombas como una salida
  input integer bombas_entrada [7:0][7:0], // Matriz de bombas (cambiando el nombre)
  output integer m_perimetro [7:0][7:0], // Matriz de perimetro
  output integer casillas_libres // Número de casillas libres
);

  // Otras lógicas y funciones pueden estar aquí

// Definición de la función crear_tablero
function automatic void crear_tablero(output integer tablero [7:0][7:0]);
  for (int i = 0; i < 8; i++) begin
    for (int j = 0; j < 8; j++) begin
      tablero[i][j] = 0; // Inicializar cada celda como 0 (representando un estado vacío)
    end
  end
endfunction

function void insertar_bombas(output bit m_bombas [7:0][7:0], input int num_bombas);

  automatic integer bombs_placed = 0; // Declarar 'bombs_placed' como automatic
  $display("El valor de num_bombas es %d", num_bombas); // Imprimir el valor de num_bombas
  for (int i = 0; i < 8; i = i + 1) begin
    for (int j = 0; j < 8; j = j + 1) begin
      if (bombs_placed < num_bombas) begin
        m_bombas[i][j] = 1'b1; // Agregar una bomba
        bombs_placed = bombs_placed + 1;
        $display("Colocando bomba en (%0d, %0d)", i, j);
      end else begin
        m_bombas[i][j] = 1'b0; // Agregar un 0
      end
    end
  end
endfunction

function void bombas_encontradas(input bit bombas_entrada [7:0][7:0], output integer m_perimetro [7:0][7:0]);
  integer i, j, x, y;

  for (i = 0; i < 8; i = i + 1) begin
    for (j = 0; j < 8; j = j + 1) begin
      m_perimetro[i][j] = 0; // Inicializar cada celda como 0 (entero)
      if (bombas_entrada[i][j] == 1'b1) begin
        // Si hay una bomba en esta celda, no necesitamos contar los vecinos, establecer a 0
        m_perimetro[i][j] = 0; // Establecer la casilla como 0 (entero)
      end else begin
        automatic integer bombs_around = 0; // Declarar como 'automatic' para reiniciar en cada iteración
        // Contar las bombas en las celdas vecinas
        for (x = i - 1; x <= i + 1; x = x + 1) begin
          for (y = j - 1; y <= j + 1; y = y + 1) begin
            if (x >= 0 && x < 8 && y >= 0 && y < 8 && bombas_entrada[x][y] == 1'b1) begin
              bombs_around = bombs_around + 1;
            end
          end
        end
        // Establecer el número de bombas vecinas en m_perimetro
        m_perimetro[i][j] = bombs_around;
      end
    end
  end
endfunction

// Nueva función para calcular casillas libres
function void cantidad_libres(input integer num_bombas, output integer casillas_libres);
  casillas_libres = 64 - num_bombas;
endfunction


  
endmodule

