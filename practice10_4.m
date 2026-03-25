%% PRACTICE 10.4. Reduction of Spectral Variability Using Periodogram Averaging

clc, close all , clear all;
duration = 10;
Fmax = 280;
Fs = 10*Fmax;
t = 0:1/Fs:duration; % 10-second duration
xn = 1*sin(2*pi*100*t) + 0.5*sin(2*pi*120*t) + ...
     0.3*sin(2*pi*140*t) + 0.1*sin(2*pi*160*t) + ...
     0.03*sin(2*pi*180*t) + 0.03*sin(2*pi*200*t) + ...
     0.1*sin(2*pi*220*t) + 0.3*sin(2*pi*240*t) + ...
     0.5*sin(2*pi*260*t) + 1*sin(2*pi*280*t);
xn_noisy = awgn(xn,0,'measured');
subplot(3,1,1)
plot(t,xn_noisy);
title('Signal with AWGN Noise at 0 dB'), grid minor
%% Frequency-domain analysis:
N = length(xn);
FACTOR = 32;
nFFT = 2^ceil(log2(N))*FACTOR;
% SIMPLE AND MODIFIED PERIODOGRAMS:
% 1. Window generation:
window_1 = rectwin(length(xn));
window_2 = hann(length(xn));
% 2. Windowing the time-domain signal:
y1_windowed = xn_noisy.*window_1';
y2_windowed = xn_noisy.*window_2';
% 3. Modified periodogram:
Periodogram_Simple = 20*log10(abs(fft(y1_windowed,nFFT)));
Periodogram_Modified = 20*log10(abs(fft(y2_windowed,nFFT)));
% Frequency axis:
f_periodogram = linspace(0,Fs,nFFT);
%% WELCH METHOD: If 20% segments are desired,
% the data segments will have length:
L = fix(length(xn)/5);
% Window of length L:
window = hann(L);
% 50% overlap (must be an integer number of samples):
noverlap = fix(length(window)/2);
nFFT_welch = 2^ceil(log2(length(window)))*FACTOR;
[P_welch,f_welch] = pwelch(xn_noisy,window,noverlap,nFFT_welch,Fs);
Periodogram_Welch = 20*log10(P_welch);
subplot(3,1,2), hold on
plot(f_periodogram,Periodogram_Simple,'k');
plot(f_periodogram,Periodogram_Modified,'b');
axis([0 Fs/2 min(Periodogram_Simple) max(Periodogram_Simple)]);
xlabel('Frequency (Hz)');
legend('Simple Periodogram','Modified Periodogram')
title('Periodograms: Simple and Modified'), grid minor
subplot(3,1,3)
plot(f_welch,Periodogram_Welch,'r');
axis([0 Fs/2 min(Periodogram_Welch) max(Periodogram_Welch)]);
xlabel('Frequency (Hz)');
title('Welch Method'), grid minor
