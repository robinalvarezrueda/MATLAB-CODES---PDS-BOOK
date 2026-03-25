%% PRACTICE 9.12. Improvement of frequency resolution using inverse windows.

clc; close all; clear all;
duration = 0.1;
F1 = 100;
F2 = 106;
Fmax = F2;
Fs = 10 * Fmax;
Ts = 1 / Fs;
tn = 0:Ts:duration;
yn = sin(2*pi*tn*F1) + 1*sin(2*pi*tn*F2);
subplot(3,1,1)
plot(tn, yn);
xlabel('t (sec)');
title('Original Signal in the Time Domain: x[n]');
grid minor
%% Frequency domain
N = length(yn);
nFFT = 2^ceil(log2(N)) * 256; % nFFT calculation (time samples)
% MATLAB built-in function:
inverse_window = 1 - hamming(N);
% Windowing:
yn_win = yn .* inverse_window';
subplot(3,1,2)
plot(tn, yn_win)
title('Windowed Signal: x[n] * (1 - Hamming)')
xlabel('t (sec)')
grid minor
%% FREQUENCY DOMAIN:
periodogram_rect = abs(fft(yn, nFFT));        % Implicit rectangular window
periodogram_mod  = abs(fft(yn_win, nFFT));    % Modified periodogram
f = linspace(0, Fs, nFFT);
subplot(3,1,3)
hold on
plot(f, periodogram_rect, 'k');
plot(f, periodogram_mod, 'r');
legend('Rectangular', 'Modified Periodogram (1 - Hamming)');
title('Simple Periodogram vs. Modified Periodogram with (1 - Hamming)')
xlabel('F (Hz)')
xlim([0 Fs/2]);
grid minor
