%% PRÁCTICA 8.1. Periodogram normalization in the physical units of the signal

clc, close all, clear all; 
duration =5;
Fmax = 125;
Fs = 10*Fmax;
Ts= 1/ Fs;
% Time base:
t = Ts:Ts:duration;
% Sampled signal
xn=1*sin(2*pi*100*t)+0.8*sin(2*pi*105*t)+...
  0.6*sin(2*pi*110*t)+0.4*sin(2*pi*115*t)+...
  0.2*sin(2*pi*120*t)+0.1*sin(2*pi*125*t);
% Time-domain plot:
plot(t, xn)
title(' Discretized signal ')
xlabel('t(seconds)')
%% Frequency domain:
N = length(xn);
nFFT = 2^ceil(log2(N))*128; % nFFT computation
% Apply MATLAB FFT
Xn1=fft(xn,nFFT);
% Magnitude of the complex values (periodogram)
Periodogram =abs(Xn1);
Periodogram_normalized = Periodogram / max(Periodogram);
% Frequency axis computation: same number of points as the periodogram, from 0 to Fs:
f=linspace(0,Fs,nFFT);
% Plot with both axes:
plot(f,Periodogram_normalized);
% By half-period symmetry, only the first half of the periodogram is of interest:
axis([0 Fs/2 0 max(Periodogram_normalized)]), ylabel('Amplitude(mV)'), xlabel('F(Hz)'),
title('NORMALIZED PERIODOGRAM BASED ON MATLAB FFT'), grid minor
