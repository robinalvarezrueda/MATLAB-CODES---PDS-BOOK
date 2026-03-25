%% PRACTICE 6.3b. Fourier Series of a Square Wave.

clc; close all; clear all;
A = 1; % Signal Amplitude
t = 0:0.02:2*pi; % Time vector (one full period of the fundamental)
% Considering the contributions of the fundamental frequency and 3 odd harmonics:
hold on; % Enable plot superposition
% Fundamental Frequency Component (BLUE):
y1 = (4*A/pi) * sin(t);
plot(t, y1, 'b'), xlabel('Time [s]'), ylabel('Amplitude [V]')
% First Odd Harmonic (n=3) (GREEN):
y2 = (4*A/(3*pi)) * sin(3*t);
plot(t, y2, 'g')
% Second Odd Harmonic (n=5) (RED):
y3 = (4*A/(5*pi)) * sin(5*t);
plot(t, y3, 'r')
% Third Odd Harmonic (n=7) (BLACK):
y4 = (4*A/(7*pi)) * sin(7*t);
plot(t, y4, 'k')
% RESULTANT SUM of the partial Fourier series (THICK RED):
y_sum = y1 + y2 + y3 + y4;
plot(t, y_sum, 'r', 'LineWidth', 3)
