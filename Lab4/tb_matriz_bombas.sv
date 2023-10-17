module tb_matriz_bombas;

  integer tablero [7:0][7:0]; // Declaración de la matriz tablero
  bit m_bombas [7:0][7:0]; // Declaración de la matriz m_bombas
  integer m_perimetro [7:0][7:0]; // Declaración de la matriz m_perimetro
  integer num_bombas = 10; // Inicializar num_bombas en 10
  integer i, j; // Variables de control
  integer casillas_libres; // Variable para almacenar el número de casillas libres
  integer posibles_bombas = 5; // Inicializar posibles_bombas en 5
  integer condicion_victoria = 0; // Inicializar posibles_bombas en 5
  integer movimiento = 0;
  integer posicion_x = 0;
  integer posicion_y = 0;
  bit tablero_victoria [7:0][7:0]; // Declaración de la matriz tablero_victoria
  

  // Instanciar el módulo matriz_bombas
  matriz_bombas matriz_bombas_inst (
    .m_bombas(m_bombas), // Conectar la matriz m_bombas
	 .tablero_victoria(tablero_victoria),
    .m_perimetro(m_perimetro), // Conectar la matriz m_perimetro
	 .casillas_libres(casillas_libres), // Conectar la salida de casillas_libres
	 .posibles_bombas(posibles_bombas) // Conectar posibles_bombas
  );

  initial begin
    // Inicializar el tablero
    matriz_bombas_inst.crear_tablero(tablero);
	 
    // Llamamos a la función insertar_bombas y pasamos num_bombas como argumento
    matriz_bombas_inst.insertar_bombas(m_bombas,tablero_victoria, num_bombas);

    // Llamamos a la función bombas_encontradas
    matriz_bombas_inst.bombas_encontradas(m_bombas, m_perimetro);
	 
	     // Llamamos a la función cantidad_libres para calcular el número de casillas libres
    matriz_bombas_inst.cantidad_libres(num_bombas, casillas_libres);
	 
	 	 
	 // Mostrar el valor de posibles_bombas antes de llamar a la función
    $display("Valor de posibles_bombas antes de llamar a la función: %d", posibles_bombas);
	 
	 // Llamar a la función incrementar_bombas
    matriz_bombas_inst.incrementar_bombas(posibles_bombas);
	 


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
	 
	     // Mostrar la matriz tablero_victoria
    $display("Matriz tablero_victoria:");
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        $write("%b ", tablero_victoria[i][j]);
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
////////	 

    // Realizar la primera prueba
    movimiento = 1;
    posicion_x = 0;
    posicion_y = 0;

    // Realizar operaciones en el tablero o configurar matrices necesarias
    // ...

    // Llamar a la función realizar_movimiento con las variables inicializadas
    matriz_bombas_inst.realizar_movimiento(tablero,tablero_victoria, m_bombas, m_perimetro, movimiento, posicion_x, posicion_y);

    // Mostrar la matriz tablero después de la primera prueba
    $display("Resultado de la primera prueba:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $write("%d ", tablero[i][j]);
      end
      $display(""); // Cambiar de línea para la siguiente fila
    end

    // Realizar la segunda prueba
    movimiento = 1;
    posicion_x = 1;
    posicion_y = 2;

    // Realizar operaciones en el tablero o configurar matrices necesarias
    // ...

    // Llamar a la función realizar_movimiento con las variables inicializadas
    matriz_bombas_inst.realizar_movimiento(tablero,tablero_victoria, m_bombas, m_perimetro, movimiento, posicion_x, posicion_y);

    // Mostrar la matriz tablero después de la segunda prueba
    $display("Resultado de la segunda prueba:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $write("%d ", tablero[i][j]);
      end
      $display(""); // Cambiar de línea para la siguiente fila
    end

    // Realizar la tercera prueba
    movimiento = 1;
    posicion_x = 7;
    posicion_y = 7;

    // Realizar operaciones en el tablero o configurar matrices necesarias
    // ...

    // Llamar a la función realizar_movimiento con las variables inicializadas
    matriz_bombas_inst.realizar_movimiento(tablero,tablero_victoria, m_bombas, m_perimetro, movimiento, posicion_x, posicion_y);

    // Mostrar la matriz tablero después de la tercera prueba
    $display("Resultado de la tercera prueba:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $write("%d ", tablero[i][j]);
      end
      $display(""); // Cambiar de línea para la siguiente fila
    end

    // Realizar la cuarta prueba
    movimiento = 2;
    posicion_x = 1;
    posicion_y = 1;

    // Realizar operaciones en el tablero o configurar matrices necesarias
    // ...

    // Llamar a la función realizar_movimiento con las variables inicializadas
    matriz_bombas_inst.realizar_movimiento(tablero,tablero_victoria, m_bombas, m_perimetro, movimiento, posicion_x, posicion_y);

    // Mostrar la matriz tablero después de la cuarta prueba
    $display("Resultado de la cuarta prueba:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $write("%d ", tablero[i][j]);
      end
      $display(""); // Cambiar de línea para la siguiente fila
    end


///////
    // Mostrar la matriz tablero_victoria, después de la cuarta prueba
    $display("impresión la matriz tablero_victoria:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $write("%b ", tablero_victoria[i][j]);
      end
      $display(""); // Cambiar de línea para la siguiente fila
    end
	 
	 
	     // Mostrar el valor de posibles_bombas después de llamar a la función
    $display("Valor de posibles_bombas después de llamar a la función: %d", posibles_bombas);
	 
	 	 // Llamar a la función decrementar_libres pasando casillas_libres como argumento inout
    matriz_bombas_inst.decrementar_libres(casillas_libres);

	 
	 	     // Mostrar el valor de posibles_bombas después de llamar a la función
    $display("casillas libres luego de decrementar: %d", casillas_libres);
	 
	 // Llamar a la función para verificar el tablero y actualizar condicion_victoria
    matriz_bombas_inst.verificar_tablero_y_actualizar(tablero, condicion_victoria);

    // Modificar la matriz tablero para contener un valor igual a -1
    tablero[3][4] = -1; // Por ejemplo, coloca un -1 en la posición (3, 4) del tablero

    // Llamar a la función para verificar el tablero y actualizar condicion_victoria
    matriz_bombas_inst.verificar_tablero_y_actualizar(tablero, condicion_victoria);
	 

	 
    // Llama a la función verificar_tablero_victoria
    matriz_bombas_inst.verificar_tablero_victoria(tablero_victoria, condicion_victoria);
	 
	
	 
	 

	 
	 
	 

    // Finalizar la simulación
    $finish;
  end
endmodule

