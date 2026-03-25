%% PRACTICE 9.5. Experimental determination of the detection capability of the periodogram.

% Determination of the PERIODOGRAM DETECTION CAPABILITY:
clc; close all; clear all;
duration = 0.5;
f1 = 100;
f2 = 200;
Fmax = 200;
Fs = 20 * Fmax;
Ts = 1 / Fs;
%% TIME DOMAIN:
tn = Ts:Ts:duration;
k = 0.01; % amplitude of the second component
y = 1*sin(2*pi*f1*tn) + k*sin(2*pi*f2*tn);
subplot(2,1,1);
plot(tn, y);
title('SIGNAL IN THE TIME DOMAIN');
xlabel('Time [s]');
ylabel('Amplitude');
grid minor;
%% FREQUENCY DOMAIN:
N = length(y);
nFFT = 2^ceil(log2(N)) * 64; % nFFT computation (time samples)
Xn = fft(y, nFFT); % FFT complex coefficients computation
% Periodogram computation:
Periodogram = abs(Xn);   
f = linspace(0, Fs, nFFT);
subplot(2,1,2);
plot(f, Periodogram, 'color', 'm');
grid minor
title('PERIODOGRAM');
xlabel('Frequency [Hz]');
ylabel('Amplitude');
axis([0 Fs/2 0 max(Periodogram)]);
