%% PRACTICE 9.6. Periodogram of a rectangular window and origin of spectral leakage

clc, clear all, close all
L = 24; % Window length
xn=ones(1,L);
%% FREQUENCY DOMAIN:
N=length(xn);
nFFT = 2^ceil(log2(N))*128; % Calculation of nFFT (samples in time)
%SIMPLE PERIODOGRAM
Xn=fft(xn,nFFT);
P=(abs(Xn));
% Creation of normalized frequency axis same as wvtool:
f = 1:1:nFFT;
f_norm = f/(nFFT/2);
subplot(1,2,1);
plot(xn,'x');
title('Rectangular window (L = 25) in the time domain');
xlabel('Samples');
ylabel('Amplitude');
axis([-10 30 0 max(xn)+1]);  grid minor
subplot(1,2,2);
plot(f_norm,P);
title('Frequency domain of the rectangular window');
xlabel('Normalized Frequency');
axis([0 1 min(P)-5 max(P)+5]); grid minor
