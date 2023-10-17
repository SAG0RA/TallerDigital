module matriz_bombas (
 input int num_bombas, // Número de bombas
  output integer tablero [7:0][7:0],
  output bit m_bombas [7:0][7:0], // Declaración de la matriz m_bombas como una salida
  input integer bombas_entrada [7:0][7:0], // Matriz de bombas (cambiando el nombre)
  output integer m_perimetro [7:0][7:0], // Matriz de perimetro
  output integer casillas_libres, // Número de casillas libres
  input integer posibles_bombas, // Declaración de posibles_bombas como entrada
  input integer condicion_victoria, // Declaración de condición victoria
  input integer movimiento, //jugada 
  input integer posicion_x, //coordenada en x
  input integer posicion_y //coordenada en y
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

function void incrementar_bombas(inout integer posibles_bombas);
  posibles_bombas = posibles_bombas + 1;
endfunction

function void decrementar_libres(inout integer casillas_libres);
  casillas_libres = casillas_libres - 1;
endfunction

function void verificar_tablero_y_actualizar(input integer tablero[7:0][7:0], inout integer condicion_victoria);
  integer i, j;
  for (i = 0; i < 8; i = i + 1) begin
    for (j = 0; j < 8; j = j + 1) begin
      if (tablero[i][j] == -1) begin
        $display("Encontrado -1, ¡ha perdido!");
        condicion_victoria = -1; // Cambiar condicion_victoria a -1 (derrota)
        return; // Puedes detener la búsqueda aquí si lo deseas
      end
    end
  end
  // Si no se encontró ningún -1, imprimir "1 no encontrado"
  $display("1 no encontrado");
endfunction


function void verificar_tablero_victoria(input bit tablero_victoria[7:0][7:0], inout integer condicion_victoria);
  integer i, j;
  for (i = 0; i < 8; i = i + 1) begin
    for (j = 0; j < 8; j = j + 1) begin
      if (tablero_victoria[i][j] != 1) begin
		$display("Encontrado 0, ¡siga jugando!");
        return; // No todas las celdas son 1, no cambiamos condicion_victoria
      end
    end
  end

  // Si llegamos aquí, todas las celdas son 1
  condicion_victoria = 1; // Establecemos condicion_victoria en 1
  $display("buajaja ganó");
endfunction
  
  


function void realizar_movimiento(
  inout integer tablero[7:0][7:0],
  input bit m_bombas[7:0][7:0],
  input integer m_perimetro[7:0][7:0],
  input integer movimiento,
  input integer posicion_x,
  input integer posicion_y
 
);
  if (movimiento == 1) begin
    if (m_bombas[posicion_x][posicion_y] == 1'b1) begin
      tablero[posicion_x][posicion_y] = -1; // Colocar -1 en tablero si hay una bomba en esa posición
    end else begin
      if (m_bombas[posicion_x][posicion_y] == 1'b0) begin
        if (m_perimetro[posicion_x][posicion_y] == 0) begin
          tablero[posicion_x][posicion_y] = 9; // Poner 9 en tablero si m_perimetro es 0
			 
        end else begin
          tablero[posicion_x][posicion_y] = m_perimetro[posicion_x][posicion_y]; // Copiar m_perimetro a tablero
			 
        end
      end
    end
  end else if (movimiento == 2) begin
    tablero[posicion_x][posicion_y] = -2; // Colocar -2 en tablero
	 
  end
endfunction

  
endmodule

