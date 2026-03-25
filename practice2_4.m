%% PRACTICE 2.4. Generation and analysis of a sawtooth signal

clc; clear all; close all
Amax = 1; % Amplitude
Fo = 2000; % Frequency
T = 1/Fo; % Period
phi = pi; % Initial phase
duration = 2*T; % Wave duration
Ts = T/100; % Sampling period
tn = 0:Ts:duration; % Discrete time vector
Fs = 1/Ts; % Sampling rate (velocity sent to the audio port)
% sawtooth wave: 
yn= sawtooth (2*pi*Fo*tn, 1);
plot(tn, yn, 'm', 'LineWidth', 2); grid on
ylim([-2, 2]); xlabel('Time (s)'); ylabel('Amplitude');
title('2 KHz sawtooth wave')
Fs = 1 / Ts;
% sound(yn, Fs) % Send sound vector to the output port
