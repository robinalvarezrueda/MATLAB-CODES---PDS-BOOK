%% PRACTICE 6.17. DFT of mixed signals

clc; clear all; close all;
f0 = 1; % Fundamental frequency
f_max = 1;
fs = 20 * f_max;
duration = 2;
ts = 1 / fs;
n = ts:ts:duration;
% Signal Generation
% Generate a triangular wave (sawtooth with peak at 0.5)
y1 = sawtooth(2*pi*f0*n, 0.5);
% Apply half-wave rectification to the triangular wave:
for i = 1:length(y1)
    if y1(i) < 0
        y1(i) = 0;
    end
end    
% Generate a cosine wave
y2 = cos(2*pi*f0*n);
% Apply half-wave rectification to the cosine wave:
for i = 1:length(y2)
    if y2(i) < 0
        y2(i) = 0;
    end
end
mixed_signal = y1 + y2;
xn = mixed_signal;
% Time-domain plot:
stem(n, xn, 'b', 'linewidth', 1)
title('Mixed Signal (Sinusoidal-Triangular)')
xlabel('t (seconds)')
grid on                                                                                                                                                                                                                               
%% FREQUENCY DOMAIN:
Xk = dft_vectorial(xn);
magnitude_spectrum = abs(Xk);
normalized_magnitude_spectrum = magnitude_spectrum / max(magnitude_spectrum);
% Normalized DFT Plot:
% Frequency axis:
f = linspace(0, fs, length(xn)); 
figure
stem(f, normalized_magnitude_spectrum)
title('Normalized Amplitude Spectrum')
xlabel('f (Hz)')
% Visualization of the normalized DFT limited to the Nyquist range (fs/2):
figure
stem(f, normalized_magnitude_spectrum)
axis([0 fs/2 0 max(normalized_magnitude_spectrum)])
title('Normalized Amplitude Spectrum - from zero to fs/2')
xlabel('f (Hz)')
grid minor
