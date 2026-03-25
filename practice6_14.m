%% PRACTICE 6.14. DFT of a bipolar sawtooth wave.

clc, close all
fo = 1; % Fundamental frequency
duration = 1; 
f_max = 100; % Since f0 = 1 Hz, assuming f_max = 100 will produce negligible aliasing
fs = 20*f_max;
ts = 1/fs;
tn = ts:ts:duration;
% Generate a sawtooth wave (50% duty cycle sawtooth)
xn = sawtooth(2*pi*fo*tn);
Xk = dft_vectorial(xn);
magnitudes = abs(Xk);
normalized_magnitudes = magnitudes / max(magnitudes);
f = linspace(0, fs, length(xn));
% Time-domain plot
stem(tn, xn, 'c', 'MarkerFaceColor', 'c', 'MarkerSize', 6)
title('Discretized Sawtooth Signal')
xlabel('t (seconds)'), axis([0 1 -1 1])
% Frequency-domain plot
figure
stem(f, normalized_magnitudes, 'LineWidth', 1.2)
title('Normalized Amplitude Spectrum '), xlabel('f (Hz)')
% Adjusted axis to display exactly 10 frequency components (0 to 10 Hz)
axis([0 10 0 1.1]), grid minor
