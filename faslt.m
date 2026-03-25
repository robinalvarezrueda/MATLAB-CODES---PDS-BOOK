%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Transformación wavelets (superlet) de superresolución adaptativa fraccional 
% 
%   Autor:         Harald Bârzan
%   Fecha:           April 2019
%   DESCRIPCION:
%
%   Calcula la transformada adaptativa de wavelets de superresolución 
%   (superlet) en los datos de entrada para producir una representación de
%   tiempo-frecuencia. Para cada frecuencia de interés, se elegirá el 
%   orden entero más cercano del intervalo de orden para producir cada 
%   superlet. Un superlet es un conjunto de wavelets con la misma 
%   frecuencia central pero con diferente número de ciclos.
%
%   REFERENCIA:
%   
%   Time-frequency super-resolution with superlets
%   Moca, V.V., Nagy-Dãbâcan, A., Bârzan, H., Mure?an, R.C.
%   https://www.nature.com/articles/s41467-020-20539-9
%   
%   NOTES:
%
%   Si los datos de entrada consisten en múltiples buffers, se calculará 
%   un espectro wavelets para cada uno de los buffers y se promediará para 
%   producir el resultado final.
%   Si el parámetro de orden (ord) está vacío, esta función devolverá el 
%   CWT estándar (un wavelets por frecuencia de interés).
%
%   INPUT:
%   > input         - [buffers x muestras] matriz
%   > Fs            - frecuencia de muestreo en Hz
%   > F             - bufer de frecuencia de interés
%   > c1            - número de ciclos de wavelets iniciales
%   > o             - [1 x 2] intervalo de órdenes de superresolución (opcional)
%   > mult          - especifica el uso de la superresolución multiplicativa
%                     (0 - aditivo, != 0 - multiplicativo)
%
%   OUTPUT:
%   > wtresult      - [frecuencias x muestras] espectro superlet

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [wtresult] = faslt(input, Fs, F, c1, o, mult)
 
% comprobar la frecuencia del parámetro de interés
if (isempty(F))
    error('frequencies not defined'); 
end
 
fix(8.2)
 
% compruebe el parámetro de orden e inicialice el orden utilizado en cada
% frecuencia. si está vacío, vaya con un orden de 1 para cada frecuencia 
% (un solo wavelets por conjunto)
if (~isempty(o))
    % el orden fraccionario es lo que el usuario ponga
    order_frac  = linspace(o(1), o(2), numel(F));
    % orden entero es el número real de wavelets en el conjunto
    order_int   = ceil(order_frac);
else
    order_frac  = ones(numel(F), 1);
    order_int   = order_frac;
end
 
% validar el buffer de entrada
if (isempty(input))
    error('input is empty'); 
end
 
% si la entrada es un vector de columnas, convertirlo en un vector de filas
if (size(input, 2) == 1 && size(input, 1) > 1)
    input = input'; 
end
 
% obtener el tamaño de la entrada
[Nbuffers, Npoints] = size(input);
 
% el relleno será del tamaño de los zero-pads laterales, 
% que sirven para evitar efectos de borde durante la convolución
 
% los conjuntos de wavelets
wavelets = cell(numel(F), max(order_int));
        
% inicializar los conjuntos de wavelets para el aditivo o el multiplicativo
% superresolution
 
padding = 0;

for i_freq = 1 : numel(F)
    for i_ord = 1 : order_int(i_freq)
        
        % calcular el número de ciclos (aditivo o multiplicativo)
        if (mult ~= 0)
            n_cyc = i_ord * c1;
        else
            n_cyc = i_ord + c1;
        end
        
        % añadir la wavelets al conjunto
        wavelets{i_freq, i_ord} = cxmorlet(F(i_freq), n_cyc, Fs);
        
        % el margen será la mitad del tamaño de la wavelets más grande
        padding = max(padding, fix(numel(wavelets{i_freq, i_ord}) / 2));

    end
end
 
% el búfer de relleno cero
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
        
        % obtener el número de wavelets enteros
        n_wavelets = floor(order_frac(i_freq));
        
        % calcular la convolución del buffer con cada wavelets 
        % del conjunto actual (wavelets enteros)
        for i_ord = 1 : n_wavelets
            % convolución restringida (tamaño de entrada == tamaño de salida)
            tempcx = conv(buffer, wavelets{i_freq, i_ord}, 'same');
            
            % acumular la magnitud (por 2 para obtener la energía espectral
            % completa energía), pool con exponente = 1
            temp = temp .* (2 .* abs(tempcx(bufbegin : bufend)) .^ 2)';
        end
        
        % manejar el exponente fraccionario
        if (is_fractional(order_frac(i_freq)) && ...
            ~isempty(wavelets{i_freq, order_int(i_freq)}))
            % establecer el índice de la orden
            i_ord = order_int(i_freq);
            
            % el exponente es el resto fraccionario
            exponent = order_frac(i_freq) - fix(order_frac(i_freq));
            
             % convolución restringida (tamaño de entrada == tamaño de salida)
            tempcx = conv(buffer, wavelets{i_freq, i_ord}, 'same');
            
            % acumular la magnitud (multiplicada por 2 para obtener la 
            % energía espectral completa), pool con exponente = 1
            temp = temp .* ((2 .* abs(tempcx(bufbegin : bufend)) .^ 2)') .^ exponent;
        end
            
        % calcular el orden de la media geométrica
        root = 1 / order_frac(i_freq);
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
    % queremos tener el último pico a 2,5 SD
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
 
% compute the complex wavelet coefficients for the desired time point t,
% bandwidth bw and center frequency cf
function res = bw_cf(t, bw, cf)
    cnorm   = 1 / (bw * sqrt(2 * pi));
    exp1    = cnorm * exp(-(t^2) / (2 * bw^2));
    res     = exp(2i * pi * cf * t) * exp1;
return;
 
% calcular los coeficientes de las wavelets complejas para el punto 
% de tiempo deseado t, ancho de banda bw y frecuencia central cf
function res = gauss(t, sd)
    cnorm   = 1 / (sd * sqrt(2 * pi));
    res     = cnorm * exp(-(t^2) / (2 * sd^2));
return;
 
% tell me if a number is an integer or a fractional
function res = is_fractional(x)
    res = fix(x) ~= x;
return;

