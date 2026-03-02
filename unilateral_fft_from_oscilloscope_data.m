%% Encabezado

% Universidad del Valle de Guatemala
% IE3032, Procesamiento de Señales

% Laboratorio No. 6: Más sobre la FFT y su inversa

% Axel González Castillo, 22493
% Angel Escobedo Morales, 22235


%% Función para graficar el espectro unilateral de una señal de osciloscopio

% Declaración de la función
function unilateral_fft_from_oscilloscope_data(csvFile)
    
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

    % En la matriz, las muestras de voltaje se guardan en la columna 5;
    % se guardan las muestras en un vector columna (RMS):
    V = M(1:sample_size, 5); V = V*(1/sqrt(2));

    % FFT (RMS-magnitud) de los datos de voltaje (Normalizados):
    FFT = fft(V);
    FFT = abs(FFT/sample_size);

    % Se hace unilateral el espectro de magnitud:
    FFT = FFT(1:(sample_size/2)+1); FFT(2:end-1) = 2*FFT(2:end-1);  % Multiplicación por 2 para evitar el promedio de frecuencias simétricas.

    % Gráfica de FFT_amplitude unilateral (Stem)
    fs = 1/sample_interval; f = (0:sample_size/2)*(fs/sample_size); % Ajuste de frecuencias en HZ.
    figure;
    stem(f, FFT); 
    xlabel('$f_o$ (Hz)', 'Interpreter','latex'); 
    ylabel('|FFT|'); title("Magnitude FFT Stem");
end