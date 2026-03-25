%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   TRANSFORMACIÓN ADAPTABLE SUPERRESOLUTION WAVELET (SUPERLET) 
% 
%   AUTHOR:         Harald Bârzan
%   DATE:           April 2019
%   DESCRIPTION:
%   Calcula la transformada adaptativa de wavelets de superresolución 
%   (superlet) en los datos de entrada para producir una representación de
%   tiempo-frecuencia. Para cada frecuencia de interés, se elegirá el orden
%   entero más cercano del intervalo de orden para producir cada superlet. 
%   Un superlet es un conjunto de wavelets con la misma frecuencia central 
%   pero con diferente número de ciclos.
%
%   REFERENCE:
%   Superlets: time-frequency super-resolution using wavelet sets
%   Moca, V.V., Nagy-Dãbâcan, A., Bârzan, H., Murean, R.C.
%   https://www.biorxiv.org/content/10.1101/583732v1.full
%   
%   NOTES:
%   Si los datos de entrada consisten en múltiples buffers, se calculará un
%   espectro wavelets para cada uno de los buffers y se promediará para 
%   producir el resultado final.
%   Si el parámetro de orden (ord) está vacío, esta función devolverá el 
%   CWT estándar (un wavelets por frecuencia de interés).
%
%   INPUT:
%   > input         - [buffers x muestras] matrix
%   > Fs            - frecuencia de muestreo en Hz
%   > F             - bufer de frecuencia de interés
%   > Ncyc          - número de ciclos de wavelets iniciales
%   > ord           - [1 x 2] intervalo de órdenes de superresolución (opcional)
%   > mult          - especifica el uso de la superresolución multiplicativa
%                     (0 - aditivo, != 0 - multiplicativo)
%   OUTPUT:
%   > wtresult      - [frecuencias x muestras] espectro superlet

function [wtresult] = aslt(input, Fs, F, Ncyc, ord, mult)
% comprobar la frecuencia del parámetro de interés
if (isempty(F))
    error('frequencies not defined'); 
end
% comprobar el parámetro de orden e inicializar el 
% orden utilizado en cada frecuencia. si está vacío, 
% ir con un orden de 1 para cada frecuencia (una sola wavelets por conjunto)
if (~isempty(ord))
    order_ls            = fix(linspace(ord(1), ord(2), numel(F)));
else
    order_ls            = ones(numel(F), 1);
end
% validar el buffer de entrada:
if (isempty(input))
    error('input is empty'); 
end
% si la entrada es un vector de columnas, convertirlo en un vector de filas
if (size(input, 2) == 1 && size(input, 1) > 1)
    input = input'; 
end
 
% obtener el tamaño de la entrada
[Nbuffers, Npoints] = size(input);
 
% el relleno será del tamaño de los cojines cero laterales, que sirven para
% evitar los efectos de borde durante la convolución
padding = 0;
 
% los conjuntos de wavelets
wavelets = cell(numel(F), max(ord));
 
%  inicializar conjuntos de wavelets para aditivo 
%  o multiplicativo superresolución
if (mult ~= 0)
    for i_freq = 1 : numel(F)
        for i_ord = 1 : order_ls(i_freq)
            % cada nueva wavelets tiene Ncyc ciclos adicionales 
            % (superresolución multiplicativa)
            wavelets{i_freq, i_ord} = cxmorlet(F(i_freq), Ncyc * i_ord, Fs);
        
            % el margen será la mitad del tamaño de la wavelets más grande
            padding = max(padding, fix(numel(wavelets{i_freq, i_ord}) / 2));
        end
    end
else
    for i_freq = 1 : numel(F)
        for i_ord = 1 : order_ls(i_freq)
            % cada nueva wavelets tiene un ciclo adicional (superresolución aditiva)
            wavelets{i_freq, i_ord} = cxmorlet(F(i_freq), Ncyc + (i_ord - 1), Fs);
        
            % el margen será la mitad del tamaño de la wavelets más grande
            padding = max(padding, fix(numel(wavelets{i_freq, i_ord}) / 2));
        end
    end
end
 
% el búfer relleno de cero
buffer = zeros(Npoints + 2 * padding, 1);
 
% el escalograma de salida
wtresult = zeros(numel(F), Npoints);
 
% indexadores de conveniencia para el búfer de relleno cero
bufbegin    = padding + 1;
bufend      = padding + Npoints;
 
% bucle sobre los buffers de entrada
for i_buf = 1 : Nbuffers
    for i_freq = 1 : numel(F)
        
        % buffer de agrupación, comienza con 1 porque estamos haciendo la media geométrica
        temp = ones(1, Npoints);
        
        % llenar la parte central del buffer con datos de entrada
        buffer(bufbegin : bufend) = input(i_buf, :);
        
        % calcular la convolución del buffer con cada wavelets 
        % del conjunto actual
        for i_ord = 1 : order_ls(i_freq)
            % convolución restringida (tamaño de entrada == tamaño de salida)
            tempcx = conv(buffer, wavelets{i_freq, i_ord}, 'same');
            
            % acumular la magnitud (por 2 para obtener la energía 
            % espectral completa
            temp = temp .* (2 .* abs(tempcx(bufbegin : bufend)) .^ 2)';
        end
        
        % calcular la potencia de la media geométrica
        root = 1 / order_ls(i_freq);
        temp = temp .^ root;
        
        % acumular el FOI actual al espectro de resultados
        wtresult(i_freq, :) = wtresult(i_freq, :) + temp;
    end
end
 
% escalar la salida por el número de buffers de entrada
wtresult = wtresult ./ Nbuffers;
 
return
 
% calcula la wavelets Morlet compleja para la frecuencia central deseada Fc
% con Nc ciclos, con una frecuencia de muestreo Fs.
function w = cxmorlet(Fc, Nc, Fs)
    %queremos tener el último pico a 2,5 SD
    sd  = (Nc / 2) * (1 / Fc) / 2.5;
    wl  = 2 * floor(fix(6 * sd * Fs)/2) + 1;
    w   = zeros(wl, 1);
    gi  = 0;
    off = fix(wl / 2);
    
    for i = 1 : wl
        t       = (i - 1 - off) / Fs;
        w(i)    = bw_cf(t, sd, Fc);
        gi      = gi + gauss(t, sd);
    end
    
    w = w ./ gi;
return
 
% calcular los coeficientes de las wavelets complejas para el punto de 
% tiempo deseado t, ancho de banda bw y frecuencia central cf
function res = bw_cf(t, bw, cf)
    cnorm   = 1 / (bw * sqrt(2 * pi));
    exp1    = cnorm * exp(-(t^2) / (2 * bw^2));
    res     = exp(2i * pi * cf * t) * exp1;
return;
 
% calcular el coeficiente gaussiano para el punto de tiempo deseado t 
% y la desviación estándar sd
function res = gauss(t, sd)
    cnorm   = 1 / (sd * sqrt(2 * pi));
    res     = cnorm * exp(-(t^2) / (2 * sd^2));
return;
