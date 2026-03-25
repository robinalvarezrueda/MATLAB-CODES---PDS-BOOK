%% PRACTICE 8.6. Obtaining the spectral amplitude associated with a given frequency

clc; close all; clear all;
duration = 5;
Fmax = 125;
Fs = 10 * Fmax;
Ts = 1 / Fs;
% Time base:
t = Ts:Ts:duration;
% Sampled signal
xn = 1*sin(2*pi*100*t) + 0.8*sin(2*pi*105*t) + ...
     0.6*sin(2*pi*110*t) + 0.4*sin(2*pi*115*t) + ...
     0.2*sin(2*pi*120*t) + 0.1*sin(2*pi*125*t);
% Time-domain plot:
plot(t, xn)
title('Discretized signal'), xlabel('t (seconds)')
%% Frequency domain:
N = length(xn);
nFFT = 2^ceil(log2(N)) * 128; % nFFT computation
% Apply MATLAB FFT
Xn1 = fft(xn, nFFT);
% Magnitude of the complex values (periodogram)
periodogram = abs(Xn1);
normalized_periodogram = periodogram / max(periodogram);
% Frequency axis computation: same number of points as the periodogram, from 0 to Fs:
f = linspace(0, Fs, nFFT);
% Plot with both axes:
stem(f, normalized_periodogram);
axis([0 Fs/2 0 max(normalized_periodogram)])
title('PERIODOGRAM BASED ON THE MATLAB FFT'), xlabel('F (Hz)'), grid minor
%% Pmax, the index where it occurs, and the corresponding frequency (Fmax):
[Pmax, index] = max(normalized_periodogram); % Returns the maximum value and its index in the vector.
Fmax_detected = f(index); % Look up that index in the frequency vector.
%% Reverse lookup: given Fo, compute the corresponding vertical-axis value:
Fo = 98;
horizontal_axis_index_Fo = floor(Fo * nFFT / Fs); % floor did not work well
vertical_axis_value = normalized_periodogram(horizontal_axis_index_Fo);
