%% PRACTICE 4.6. Generation of a simple echo in an audio signal.

clc,close all,clear all
[y,Fs]=audioread('HowAreYou.wav');
y1=y(:,1); % In samples
% Introduction of echo:
time_delay=0.3; % In seconds
delay_samples=time_delay*Fs; % Conversion factor: Fs(samples/sec)
% Added to the original signal is the same signal but delayed and with a smaller amplitude:%y_eco = [original_left_channel' zeros(1, delay)] + 0.7*[zeros(1,delay) original_left_channel'];
y1_original_zeros = [y1'  zeros(1,delay_samples)];
echo = 0.5*[zeros(1, delay_samples) y1'];
y_echo = y1_original_zeros + echo;
figure
subplot(3,1,1)
plot (y1_original_zeros,'k')
title('original left channel with the delay added at the end')
subplot(3,1,2)
plot (echo, 'b')
title('echo: original left channel with the delay added at the beginning and with a smaller amplitude ')
subplot(3,1,3)
plot (y_echo,'r'), title('original left channel plus the echo ')
sound(y_echo,Fs)   % First, remove all graphs.
