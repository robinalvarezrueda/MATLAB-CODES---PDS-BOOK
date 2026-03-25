%% PRACTICE 9.1. Appearance of the SINC in the periodogram of a single-component signal.

clc; clear all; close all
f1 = 100;
duration = 0.1;
Fmax = f1;
Fs = 10 * Fmax; 
Ts = 1 / Fs;
n = 0:Ts:duration; % time base (discrete)
xn = sin(2*pi*f1*n); % amplitude vector
% Plot (time domain)
subplot(2,1,1)
plot(n, xn), grid minor
title('Time-Domain Signal')
xlabel('t [s]')
ylabel('Amplitude')

%% Frequency domain (periodogram)
N = length(xn); % number of samples
FACTOR = 256;
nFFT = 2^(ceil(log2(N))) * FACTOR;
Xn = fft(xn, nFFT); % nFFT complex values
% Periodogram = magnitude of FFT
periodogram_1 = abs(Xn);
% Frequency axis
f = linspace(0, Fs, nFFT);
% Plot (periodogram)
subplot(2,1,2)
plot(f, periodogram_1), grid minor
axis([0 Fs/2 0 max(periodogram_1)]) % Xmin Xmax Ymin Ymax
title('Periodogram')
xlabel('f [Hz]')
ylabel('Amplitude')