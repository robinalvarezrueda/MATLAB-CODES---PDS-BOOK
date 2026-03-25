%% PRACTICE 6.11b. DFT of a sinusoidal signal

clc; close all; clear all;
% Duration must cover at least one full period of the signal.
% Given f0 = 1 Hz (T = 1s), the minimum observation window is 1 second.
f0 = 1; 
duration = 1; 
% Since f0 = 1 Hz, the maximum frequency of interest (fmax) is 1 Hz.
fmax = 1; 
% Sampling Theorem (Nyquist Criterion): Applying an oversampling factor of 10.
fs = 10 * fmax; 
ts = 1 / fs;
% Time base (discrete time vector):
n = ts:ts:duration;
% Sampled signal at discrete-time values:
xn = sin(2 * pi * f0 * n);
% Time-domain representation:
stem(n, xn, 'r', 'LineWidth', 3);
title('Discretized Signal (Sampled)');
xlabel('Time [s]');
ylabel('Amplitude');
% Frequency Domain Analysis: DFT Computation
N = length(xn);
Xk = dft_vectorial(xn); % Assumes a vectorized DFT function exists
magnitude_spectrum = abs(Xk);
% Normalize the spectrum for relative analysis:
normalized_magnitude = magnitude_spectrum / max(magnitude_spectrum);
% Normalized DFT Plot:
% Frequency axis mapping from 0 to Fs:
f = linspace(0, fs, length(xn));
figure
stem(f, normalized_magnitude)
title('Normalized Magnitude Spectrum (Full Span)');
xlabel('Frequency [Hz]');
grid on;
% Visualization of the Normalized DFT limited to the Nyquist Frequency (Fs/2):
figure
stem(f, normalized_magnitude)
% Restricting the view to the non-redundant spectrum:
axis([0 fs/2 0 1.1]) 
title('Normalized Magnitude Spectrum (0 to f_s/2)');
xlabel('Frequency [Hz]');
grid minor;
