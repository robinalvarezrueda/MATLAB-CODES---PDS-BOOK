%% PRACTICE 10.2. Contamination of a Sinusoidal Signal with AWGN and Spectral Analysis

clear all; close all; clc
% Signal generation
duration = 4;
f1 = 200;
Fmax = f1;
Fs = 10*Fmax;
Ts = 1/Fs;
tn = 0:Ts:duration;
yn = sin(2*pi*f1*tn);

% Adding noise to the signal
SNR = -15; % SNR in dB
yn_noise = awgn(yn, SNR, 'measured');

% yn_noise = my_awgn(yn,SNR);

% Time-domain plots
hold on
plot(tn,yn,'LineWidth',1.5);
xlabel('Time [s]');
ylabel('Amplitude');
title('Effect of WGN Noise on a Sinusoidal Signal');
xlim([0 5/Fmax])
plot(tn,yn_noise)
legend('Original Signal','Signal with Noise')
grid minor
%% Histogram and its best Gaussian fit:
figure
histfit(yn_noise,100)
title('Histogram of Signal with WGN Noise')
%% Measurements of the four statistical moments:
% Central tendency (arithmetic mean):
mean_value = mean(yn_noise);
% Dispersion (standard deviation):
std_deviation = std(yn_noise);
% Asymmetry (skewness):
skewness_value = skewness(yn_noise);
% Tail heaviness (kurtosis):
kurtosis_value = kurtosis(yn_noise);
fprintf('The mean value is %.5f\n',mean_value)
fprintf('The standard deviation is %.5f\n',std_deviation)
fprintf('The skewness is %.5f\n',skewness_value)
fprintf('The kurtosis is %.5f\n',kurtosis_value)
%% Frequency-domain analysis
N = length(yn);
nFFT = 2^ceil(log2(N));
f = linspace(0, Fs, nFFT);
w = rectwin(N);
ynWindowed = yn.*w';
Periodogram_Yn = 20*log10(abs(fft(ynWindowed, nFFT)))*32;
yn_noise_Windowed = yn_noise.*w';
Periodogram_Yn_Noise = 10*log10(abs(fft(yn_noise_Windowed, nFFT)))*24;
yn_noisyWindowed = yn_noise.*w';
Yn_NoisyFFT = 10*log10(abs(fft(yn_noise_Windowed, nFFT)))*32;
% Frequency-domain plots
figure;
subplot(2,1,1)
plot(f,Periodogram_Yn);
xlabel('Frequency [Hz]');
ylabel('Amplitude [dB]');
title('Periodogram of the Sinusoidal Signal');
axis([0 Fs/2 min(Periodogram_Yn) max(Periodogram_Yn)]);
grid minor;
subplot(2,1,2)
plot(f, Periodogram_Yn_Noise, 'g');
xlabel('Frequency [Hz]');
ylabel('Amplitude [dB]');
title('Periodogram of the (Signal + WGN Noise)');
axis([0 Fs/2 min(Periodogram_Yn_Noise) max(Periodogram_Yn_Noise)]);
grid minor;
