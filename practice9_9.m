%% PRACTICE 9.9. Prediction of frequency resolution from the main lobe width.

clc; close all; clear all;
f1 = 100;
Fmax = f1;
duration = 0.1;
Fs = 10 * Fmax; Ts = 1 / Fs;
n = 0:Ts:duration; % Time base (discrete)
xn = sin(2*pi*f1*n); % Amplitude vector
% FREQUENCY DOMAIN:
N = length(xn);
FACTOR = 16;
nFFT = 2^ceil(log2(N)) * FACTOR; % nFFT calculation (time samples)
% SIMPLE PERIODOGRAM
Xn = fft(xn, nFFT);
P = 20*log10(abs(Xn));
% Take only the first half since the second half is duplicated
P = P(1:nFFT/2+1);
% Normalized frequency axis
f = 1:nFFT/2+1;
f_norm = f / (nFFT/2);
% Measurement of main lobe width at -6 dB
P_max = max(P);
P_6dB = fix(max(P)) - 6;  % Value at −6 dB
index_P_6dB = find(fix(P) == P_6dB);
f_norm_6dB = f_norm(index_P_6dB);
% Denormalization:
Index = f_norm_6dB * (nFFT / 2);
ClosestFreq = Index * (Fs / nFFT);
% Considering only the approach from the right side of f1
for i = 1:length(ClosestFreq)
    if ClosestFreq(i) > f1
        Prediction(i) = ClosestFreq(i); % Frequencies higher than f1
    end
end
Prediction(Prediction == 0) = []; % Eliminating zeros from the vector
Prediction = round(mean(Prediction),1) % Obtaining the average closest frequency
