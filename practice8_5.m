%% PRACTICE 8.5. Time evolution of the maximum frequency of the periodogram

clc, clear all, close all
duration = 10;
fo = 1000;
f1 = 2000; 
Fmax=f1;
Fs = 10*Fmax;
Ts = 1/Fs;
tn = Ts:Ts:duration;
p=1; % p is the polynomial order (p=1: linear) (p=2: quadratic)
beta   = (f1-fo)./(duration.^(p));
fi=fo+beta*tn; % + for increasing instantaneous frequency
y = cos(2*pi*fi.*tn); % Element-wise operator (.) is required to avoid errors.
plot(tn,y);
title('CHIRP: from 1 kHz to 2 kHz in 10 seconds');
xlabel('time [s]');
ylabel('Amplitude');
grid minor;
sound(y,Fs)

%-----CREATION AND COMPUTATION OF FMAX EVOLUTION-----
portion = input('Enter the size of the portion you wish to view (%): ');   
Longitude = length(y);                             % Chirp signal length
Longitude_percent = Longitude * portion /100;        % Convert length to percentage
portions = floor(100 / portion);                                  % Number of desired portions of the total sample
factor = 128;                                                             % Factor for nFFT resolution
points_nFFT = 2^ceil(log2(Longitude_percent))*factor;       % nFFT points computation

% For-loop to sweep through the signal portions
freq = Fs*(0:(points_nFFT/2))/points_nFFT;         % Frequency vector
var1 = 1;                                                                    % Auxiliary variable used in the for-loop portions
var2 = Longitude_percent;                                        % Auxiliary variable used in the for-loop portions
for i = 1:portions
    matrix = y(:,var1:var2);                                   
    Y = fft(matrix, points_nFFT);                                          
    P = Y(1: points_nFFT/2+1);                                             
    [Pmax(i), index] = max(abs(P));                                       
    F_max(i) = freq(index);                                                 
    var1 = var1 + Longitude_percent;                                     
    var2 = var2 + Longitude_percent;                                     
end

%------PLOT OF FMAX EVOLUTION---------
t_n = linspace(0,duration, length(F_max)); 
figure                          
plot(t_n,F_max,'m-o','LineWidth',1)                                      
title("Evolution of the maximum frequency")                            
xlabel('Time [s]')                                                               
ylabel('Frequency [Hz]')                                                           
grid minor


