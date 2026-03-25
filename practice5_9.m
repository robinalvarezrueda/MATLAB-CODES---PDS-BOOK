%% PRACTICE 5.9. Graphical and physical interpretation of autocorrelation

clc, close all, clear all;
% Square wave signal of 100 Hz:
duration=1;
Fo= 100;
Fmax= 50*Fo; % due to the harmonics
Fs= 10*Fmax;
Ts=1/Fs;
tn= 0:Ts:duration;
yn= square(2*pi*Fo*tn);
%% Square wave signal of 100 Hz and its Autocorrelation:
Autocor_yn= xcorr(yn); % with a maximum of 1
subplot(3,2,1);
plot(yn); title('Square Signal');
subplot(3,2,2);
plot(Autocor_yn); title('Autocorrelation of the Square Signal');
%% AWGN Noise and its autocorrelation:
noise= randn(1, length(yn));
Autocor_noise=xcorr(noise);
subplot(3,2,3)
plot(noise); title('Noise');
subplot(3,2,4);
plot(Autocor_noise); title('Autocorrelation of the Noise');
%% (Square Signal + AWGN) and its autocorrelation:
ysum= yn+noise;
Autocor_ysum=xcorr(ysum);
subplot(3,2,5)
plot(ysum); title('Square Signal + Noise');
subplot(3,2,6)
plot(Autocor_ysum); title('Autocorrelation of Square Signal + Noise');
