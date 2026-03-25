%% PRACTICE 9.11. Improvement of detection capability through the modified periodogram.

clc; close all; clear all;
duration = 1;
fmax = 200;
Fs = 10 * fmax;
Ts = 1 / Fs;
tn = 0:Ts:duration;
yn = sin(2*pi*tn*100) + 0.0000001*sin(2*pi*tn*200);
plot(tn, yn);
xlabel('t (seconds)');
title('Original Signal in the Time Domain');
%% Frequency domain
N = length(yn);
nFFT = 2^ceil(log2(N)) * 2; % nFFT calculation (time samples)
window1 = rectwin(N);
window2 = triang(N);
window3 = hamming(N);
window4 = hann(N);
window5 = blackmanharris(N);
% Windowing
yn_win1 = yn .* window1';
yn_win2 = yn .* window2';
yn_win3 = yn .* window3';
yn_win4 = yn .* window4';
yn_win5 = yn .* window5';
figure;
plot(tn, yn_win5);
xlabel('t (seconds)');
title('Original Signal Windowed with 4-Term Blackman-Harris');
grid minor;
periodogram1 = 10*log10(abs(fft(yn_win1, nFFT))); % Implicitly rectangular window
periodogram2 = 10*log10(abs(fft(yn_win2, nFFT)));
periodogram3 = 10*log10(abs(fft(yn_win3, nFFT)));
periodogram4 = 10*log10(abs(fft(yn_win4, nFFT)));
periodogram5 = 10*log10(abs(fft(yn_win5, nFFT)));
f = linspace(0, Fs, nFFT);
figure;
hold on;
plot(f, periodogram1, 'k');
plot(f, periodogram3, 'r');
plot(f, periodogram4, 'g');
plot(f, periodogram5, 'b');
legend('Simple Periodogram (Rectangular)', ...
       'Modified Periodogram (Hamming)', ...
       'Modified Periodogram (Hann)', ...
       'Modified Periodogram (BH4)');
title('Simple Periodogram vs. Modified Periodogram'); xlabel('F (Hz)'); xlim([0 Fs/2]);
grid minor;
