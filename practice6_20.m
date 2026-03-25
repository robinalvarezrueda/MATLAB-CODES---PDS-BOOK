%% PRACTICE 6.20. Application of the vector DFT to the analysis of an audio signal.

clc, close all, clear all;
 [y, fs] = audioread('Original.wav'); % Reading the audio signal
y = y(:,1); % Selecting a single channel (Mono)
y = y(1:10000); % Only the first 10,000 samples are taken to avoid the 'OUT OF MEMORY' error
xn = y'; % Crucial step for the DFT: The input must be a ROW VECTOR
duration = length(y)/fs;
ts = 1/fs;
n = ts:ts:duration; % Time base
plot(n, xn) % Time-domain plot
title('Discretized Signal'), xlabel('t (seconds)')
% Frequency domain:
N = length(xn);
Xk = dft_vectorial(xn);
magnitude_spectrum = abs(Xk);
% Frequency axis mapping:
f = linspace(0, fs, length(xn)); % Plot in the frequency domain
figure
plot(f, magnitude_spectrum)
title('Magnitude Spectrum'), xlabel('f (Hz)')
% Visualization limited to the Nyquist range (fs/2):
figure
plot(f, magnitude_spectrum)
% Viewing range from 0 to fs/2
axis([0 fs/2 0 max(magnitude_spectrum)]); 
title('Magnitude Spectrum - 0 to fs/2'), xlabel('f (Hz)')
