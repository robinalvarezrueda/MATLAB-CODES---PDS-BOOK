%% PRACTICE 8.8. Spectral-area computation over selected frequency bands

clc; close all; clear all;
duration = 5;
Fmax = 125;
Fs = 100 * Fmax;
Ts = 1 / Fs;
% Time vector
tn = Ts:Ts:duration;
% Signal
f1 = 100; 
f2 = 105;
f3 = 110;
f4 = 115;
f5 = 120;
f6 = 125;
yn = 1*sin(2*pi*f1*tn) + 0.8*sin(2*pi*f2*tn) + ...
     0.6*sin(2*pi*f3*tn) + 0.4*sin(2*pi*f4*tn) + ...
     0.2*sin(2*pi*f5*tn) + 0.1*sin(2*pi*f6*tn);
%% Periodogram computation:
N = length(yn);
nFFT = 2^ceil(log2(N)) * 128; % nFFT computation
y_1 = fft(yn, nFFT); % FFT complex values computation
P1 = abs(y_1) / max(abs(y_1));
% Extract half of the spectrum to avoid issues with findpeaks
P = P1(1:nFFT/2+1);
f = Fs * (0:(nFFT/2)) / nFFT;
% Find the 4 highest peaks of the periodogram
[peaks, locations] = findpeaks(P, 'SortStr', 'descend', 'NPeaks', 4);
F_Peaks = f(locations);
% Areas under the curve:
% First component:
P_A1 = P(find(f >= F_Peaks(1)-2 & f <= F_Peaks(1)+2));
f_A1 = f(find(f >= F_Peaks(1)-2 & f <= F_Peaks(1)+2)); % used in the fill function
A1_sum = sum(P_A1);
A1_trapz = trapz(P_A1);
% Second component:
P_A2 = P(find(f >= F_Peaks(2)-2 & f <= F_Peaks(2)+2));
f_A2 = f(find(f >= F_Peaks(2)-2 & f <= F_Peaks(2)+2)); % used in the fill function
A2_sum = sum(P_A2);
A2_trapz = trapz(P_A2);
% Third component:
P_A3 = P(find(f >= F_Peaks(3)-2 & f <= F_Peaks(3)+2));
f_A3 = f(find(f >= F_Peaks(3)-2 & f <= F_Peaks(3)+2)); % used in the fill function
A3_sum = sum(P_A3);
A3_trapz = trapz(P_A3)
% Fourth component:
P_A4 = P(find(f >= F_Peaks(4)-2 & f <= F_Peaks(4)+2));
f_A4 = f(find(f >= F_Peaks(4)-2 & f <= F_Peaks(4)+2));
A4_sum = sum(P_A4);
A4_trapz = trapz(P_A4);
% Plot of the signal areas
figure
plot(f, P)
hold on
fill(f_A1, P_A1, 'b', ...
     f_A2, P_A2, 'g', ...
     f_A3, P_A3, 'r', ...
     f_A4, P_A4, 'y')
title('First 4 Spectral Components')
xlabel('f (Hz)'), ylabel('Amplitude (mV)')
legend('Signal Spectrum', 'Area 1', 'Area 2', 'Area 3', 'Area 4')
xlim([95 130])
