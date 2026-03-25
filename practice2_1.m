%% PRACTICE 2.1. Basic generation of a sinusoidal signal

clc; clear all; close all;
%% Wave parameter configuration:
Amax = 1; % Maximum amplitude
Fo = 1000; % Frequency
T = 1/Fo; % Period
% Initial phase:
Initial_phase = pi; % In radians, as the sine function accepts arguments in radians.
% Wave duration: only 2 periods to be able to verify parameters
duration = 2*T;
% Sampling period or time between samples:
Ts = T/100;
% Discrete time vector:
tn = 0:Ts:duration;
%% Signal construction -- amplitude vector: 
yn = Amax*sin(2*pi*Fo*tn + Initial_phase);

%% Signal plot 
plot(tn, yn, 'ob', 'MarkerSize', 4); 
% Labels and title 
xlabel('Time'); 
ylabel('Amplitude'); 
title('1 kHz sinusoidal wave with an initial phase of 180°');
%% SOUND GENERATION 
Fs = 1/Ts; % Sampling frequency 
sound(yn, Fs); % Sound output 
