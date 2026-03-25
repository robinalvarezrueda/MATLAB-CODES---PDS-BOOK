%% PRACTICE 2.5. Generation of a full-wave rectified sinusoid

clc; clear all; close all
Amax = 0.5;
Fo = 500;
T = 1/Fo;
duration = 2*T;
Ts = T/100;
tn = 0:Ts:duration; % Discrete time vector
y = Amax*sin(2*pi*Fo*tn); % Amplitude vector
% The full-wave rectified signal is obtained by inverting 
% the negative half-cycles using the abs command:
y_abs = abs(y);
% Visual verification:
figure % Opens a new figure window
stem(tn, y_abs) % Plots Time Axis vs. Amplitude Axis
grid on % Adds minor grid lines to the background
xlabel('Time(sec)') % X-axis title
ylabel('Amplitude') % Y-axis title
title('Full-Wave Rectified Signal') % Plot title
% Audio verification:
% Fs = 1/Ts;
% sound(y_abs, Fs)
