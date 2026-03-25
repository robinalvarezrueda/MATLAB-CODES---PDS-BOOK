%% PRACTICE 6.4b. Fourier Series of a Sawtooth Wave.

clc; close all; clear all;
A = 1; % Signal Amplitude
t = 0:0.02:2*pi; % Time vector (full period)
% Analyzing contributions from the fundamental frequency and successive harmonics:
hold on; % Enable plot superposition
% Fundamental Frequency Component (BLUE):
y1 = (-A/pi) * sin(t);
plot(t, y1, 'b');
xlabel('t [s]');
ylabel('y(t) [V]');
% Second Harmonic (n=2) (GREEN):
y2 = (-A/(2*pi)) * sin(2*t);
plot(t, y2, 'g');
% Third Harmonic (n=3) (RED):
y3 = (-A/(3*pi)) * sin(3*t);
plot(t, y3, 'r');
% Fourth Harmonic (n=4) (BLACK):
y4 = (-A/(4*pi)) * sin(4*t);
plot(t, y4, 'k');
% RESULTANT SUM of the partial Fourier series (THICK RED):
% This represents the reconstructed sawtooth approximation using 4 components.
y_sum = y1 + y2 + y3 + y4;
plot(t, y_sum, 'r', 'LineWidth', 3);
title('Bipolar Sawtooth Wave Reconstruction with 4 Harmonic Components');
grid on;
