%% PRACTICE 8.3. Spectral analysis of a linear chirp signal

clc, clear all, close all
duration = 10;                                                    % Signal duration
freq1 = 1000;                                                     % Initial frequency
freq2 = 2000;                                                     % Final frequency
Fmax = freq2;                                                    % Maximum signal frequency
Fs = 20*Fmax;                                                  % Sampling frequency
Ts = 1/Fs;                                                          % Sampling period
tn = Ts:Ts:duration;                                           % Time vector
signal_chirp = chirp(tn, freq1,duration,freq2);   % Chirp function with two frequencies
xn=signal_chirp;
plot(tn,xn)
%% Frequency domain:
N = length(xn);
nFFT = 2^ceil(log2(N))*128; % nFFT computation
% Apply MATLAB FFT
Xn1=fft(xn,nFFT);
% Magnitude of the complex values (periodogram)
Periodogram=abs(Xn1);
% Frequency axis computation: same number of points as the periodogram, from 0 to Fs:
f=linspace(0,Fs,nFFT);
% Plot with both axes:
figure
plot(f,Periodogram);
% By half-period symmetry, only the first half of the periodogram is of interest:
axis([0 Fs/2 0 max(Periodogram)]) 
xlabel('F(Hz)'), ylabel ('Amplitude')
title('PERIODOGRAM BASED ON THE MATLAB FFT')
grid minor
