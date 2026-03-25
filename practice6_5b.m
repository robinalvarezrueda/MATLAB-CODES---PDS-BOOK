%% PRACTICE 6.5. Fourier Series of a Triangular Wave

clc; close all; clear all;
A = 1; % Signal Amplitude [V]
t = 0:0.02:4*pi; % Time vector (spanning two fundamental periods)

% Superposition of the fundamental component and successive odd harmonics:
hold on; % Enable plot superposition
% Fundamental Frequency Component (n=1) (BLUE):
% Note the 1/pi^2 scaling factor characteristic of triangular waves.
y1 = (8*A / (pi^2)) * cos(t);
plot(t, y1, 'b'); xlabel('Time [s]'); ylabel('Amplitude [V]');
% First Odd Harmonic (n=3) (GREEN): Amplitude scales by 1/n^2 (1/9)
y2 = (8*A / (9*pi^2)) * cos(3*t);
plot(t, y2, 'g');
% Second Odd Harmonic (n=5) (RED): Amplitude scales by 1/n^2 (1/25)
y3 = (8*A / (25*pi^2)) * cos(5*t);
plot(t, y3, 'r');
% Third Odd Harmonic (n=7) (BLACK): Amplitude scales by 1/n^2 (1/49)
y4 = (8*A / (49*pi^2)) * cos(7*t);
plot(t, y4, 'k');
% RESULTANT SUM of the partial Fourier series (THICK RED): This represents the reconstructed triangular approximation.
y_sum = y1 + y2 + y3 + y4;
plot(t, y_sum, 'r', 'LineWidth', 3); 
title('Triangular Wave Reconstruction: Summation of 4 Odd Harmonics'); grid on;
