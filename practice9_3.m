%% PRACTICE 9.3. Independence of frequency resolution with respect to component values

clc; clear all; close all;
f1 = 1000;
f2 = 1007;
duration = 0.1; 
Fs = 10 * f2; 
Ts = 1 / Fs;
% Time base (discrete)
tn = 0:Ts:duration;
xn = sin(2*pi*f1*tn) + sin(2*pi*f2*tn); % Amplitude vector
% Plot (time domain)
figure(1)
subplot(2,1,1)
plot(tn, xn)
grid on; grid minor
title('Time Domain Graph');
xlabel('t [s]');
ylabel('Amplitude');
% Frequency domain (periodogram)
N = length(xn); % number of samples of the discretized signal
FACTOR = 128;
nFFT = 2^(ceil(log2(N))) * FACTOR;
Xn = fft(xn, nFFT); % nFFT complex values
% Periodogram = magnitude(fft)
periodogram_1 = abs(Xn); % Xn has nFFT points
% Frequency axis
f = linspace(0, Fs, nFFT);
% Plot (periodogram)
subplot(2,1,2)
plot(f, periodogram_1);
axis([0 Fs/2 0 max(periodogram_1)]); % Xmin Xmax Ymin Ymax
title('Periodogram');xlabel('f [Hz]'); ylabel('Amplitude')
