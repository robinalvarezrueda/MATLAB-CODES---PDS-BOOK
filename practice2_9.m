%% PRACTICE 2.9. Independent use of the two audio output channels

%% Program to handle the 2 output channels of the 
%% audio port independently
clc; close all; clear all;
Amax = 1;      % Signal amplitude
F1 = 500;      % Frequency 1
F2 = 1000;     % Frequency 2
% Time between samples considering the most demanding Frequency (F2):
T = 1/F2;
duration = 4*T; % Duration in seconds
Ts = T/100;     % Considering 100 samples per period
tn1 = 0:Ts:duration; % Discrete time vector
% Generation of sine waves with different frequencies
% Multiply by 0.75 (optional) to ensure signal does not exceed +/-1 volt.
yn1 = Amax * sin(2*pi*F1*tn1);
yn2 = Amax * sin(2*pi*F2*tn1);
% Visual verification:
plot(tn1, yn1, tn1, yn2);
legend('Left Channel: 500 Hz Sine Wave', 'Right Channel: 1000 Hz Sine Wave')
title('Simultaneous Generation of Two Different Waves')
xlabel('Time (s)');
ylabel('Amplitude');
grid on 
% Create the matrix: Column 1 corresponds to Channel 1 (Left)
% and Column 2 corresponds to Channel 2 (Right)
yn = [yn1' yn2'];
% Audio verification:
% Fs = 1 / Ts;
% sound(yn, Fs)
