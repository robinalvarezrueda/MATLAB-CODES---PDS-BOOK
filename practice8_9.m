%% PRACTICE 8.9. Band-based spectral analysis on audio signals

clc; close all; clear all;
% Already discretized signal: audio
[xn, Fs] = audioread('Original.wav');
xn = xn(:,1); % Extract a single channel
duration = length(xn) / Fs;
Ts = 1 / Fs;
% Time base:
tn = Ts:Ts:duration;
plot(tn, xn)
title('Audio Signal')
xlabel('t (seconds)')
grid minor
%% Frequency domain:
N = length(xn);
nFFT = 2^(ceil(log2(N))) * 1;
% Apply MATLAB FFT
Xn = fft(xn, nFFT); % Complex coefficients
% Compute the periodogram (magnitude of the complex coefficients)
periodogram = abs(Xn);
% Normalize the periodogram
normalized_periodogram = periodogram / max(periodogram);
% Extract half-spectrum (half-period symmetry)
P = normalized_periodogram(1:nFFT/2+1);
% Frequency axis:
f = Fs * (0:(nFFT/2)) / nFFT;
figure
plot(f, P)
title('Audio Signal Spectrum')
xlabel('f (Hz)')
grid minor

% AREA COMPUTATION IN BAND 1:
% Band 1: v1 = 200 Hz, v2 = 300 Hz
v1 = 200;
v2 = 300;
P_A1 = P(find(f >= v1 & f <= v2));
% Area under the curve over the interval:
area_band1_sum = sum(P_A1);
area_band1_trapz = trapz(P_A1);
% AREA COMPUTATION IN BAND 2:
% Band 2: v3 = 600 Hz, v4 = 700 Hz
v3 = 600;
v4 = 700;
P_A2 = P(find(f >= v3 & f <= v4));
% Area under the curve over the interval:
area_band2_sum = sum(P_A2);
area_band2_trapz = trapz(P_A2);
