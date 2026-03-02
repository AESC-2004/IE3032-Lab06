%% Encabezado

% Universidad del Valle de Guatemala
% IE3032, Procesamiento de Señales

% Laboratorio No. 6: Más sobre la FFT y su inversa

% Axel González Castillo, 22493
% Angel Escobedo Morales, 22235


%% Función para graficar el espectro unilateral de una señal de osciloscopio guardada en un CSV

% Declaración de la función
function stairs_oscilloscope_data_plot(csvFile)
    
    % Se declara el argumento como uno de tipo "string":
    arguments
        csvFile (1,1) string
    end

    % Se guarda el .csv en una matriz:
    M = readmatrix(csvFile);

    % Dado el formato de datos provistos por el osciloscopio, el número 
    % de muestras se guarda en la fila 1, columna 2 de la matriz. Se 
    % guarda el número de muestras en una variable:
    sample_size = M(1,2);

    % El intervalo de muestreo se guarda en la fila 2, columna 2 de la 
    % matriz. Se guarda el intervalo de muestreo en una variable:
    sample_interval = M(2,2);

    % Se establece un intervalo de tiempo del número de muestras por el
    % intervalo de muestreo:
    t = sample_interval*(0:sample_size-1);

    % En la matriz, las muestras de voltaje se guardan en la columna 5;
    % se guardan las muestras en un vector columna:
    V = M(1:sample_size, 5);

    % Se utiliza "stairs" para graficar:
    figure;
    stairs(t, V, "LineWidth", 2); 
    grid on; xlabel("$t\;[\mathrm{seg}]$", "Interpreter", "latex"); 
    ylabel("$V\;[\mathrm{Volts}]$", "Interpreter", "latex"); 
    title("Datos de osciloscopio");
end

