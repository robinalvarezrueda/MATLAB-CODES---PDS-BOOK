%% PRACTICE 6.12. DFT of a Bipolar Square Wave 

clc, close all, clear all;
% Duration must be at least one period of the signal
% Since f0 = 1 Hz, it should be at least 1 second.
f0 = 1;
duration = 1; 
% Since f0 = 1 Hz, assuming f_max = 100 will produce negligible aliasing.
f_max = 100; 
% Sampling Theorem: an oversampling factor of 20 is assumed
% to achieve high accuracy in the localization of components.
fs = 20*f_max; ts = 1/fs;
% Time base:
n = ts:ts:duration;
% Signal sampled at discrete-time values:
xn = square(2*pi*f0*n);
% Time-domain plot:
stem(n, xn, 'b', 'linewidth', 3)
title('Discretized Signal')
xlabel('t (seconds)')
% Frequency domain: DFT
N = length(xn);
Xk = dft_vectorial(xn);  % N complex coefficients
magnitude_spectrum = abs(Xk);  % Magnitudes of the N complex coefficients
normalized_magnitude_spectrum = magnitude_spectrum/max(magnitude_spectrum);
% Normalized DFT plot:
% Frequency axis:
f = linspace(0, fs, length(xn));
% Visualization of the normalized DFT showing only 9 components (up to 9 Hz):
figure
stem(f, normalized_magnitude_spectrum)
% Adjusted axis to show components from 0 to 9 Hz:
axis([0 9 0 1.1]) 
title('Normalized Amplitude Spectrum - First 9 Hz Components')
xlabel('f (Hz)'), grid minor

