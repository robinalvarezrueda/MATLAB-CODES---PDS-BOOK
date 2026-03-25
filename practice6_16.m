%% PRACTICE 6.16. Analysis of the computational cost of the DFT

clc, close all
f1 = 1000; f2 = 2000; f3 = 3000; % Individual tone frequencies
f_max = f3; % Maximum frequency component
duration = 1; 
% Sampling Theorem: using an oversampling factor of 30
fs = 30 * f_max; 
ts = 1 / fs;
t = ts:ts:duration;
% Multi-tone signal composed of three sinusoids
xn = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
Xk = dft_vectorial(xn);
magnitudes = abs(Xk);
normalized_magnitudes = magnitudes / max(magnitudes);
f = linspace(0, fs, length(xn));
% Time-domain plot
stem(t, xn, 'b', 'MarkerFaceColor', 'c', 'MarkerSize', 6)
title('Composite Signal (Three Tones)')
xlabel('t (s)')
axis([0 1 -3 3])
grid minor
% Frequency-domain plot
figure
stem(f, normalized_magnitudes, 'LineWidth', 1.2)
title('Normalized Amplitude Spectrum')
xlabel('f (Hz)')
% Adjusted axis to display exactly 10 frequency components (0 to 10 Hz)
axis([0 10 0 1.1])
grid minor
