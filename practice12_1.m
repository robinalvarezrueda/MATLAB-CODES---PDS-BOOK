%% Practice 12.1. Design and Analysis of an IIR Digital Filter with an Arbitrary Frequency Response

clc; close all; clear all;
n = 10; % Filter order
Fmax = 1000;
% Normalized frequency vector (0 to 1 corresponds to 0 to Fmax)
f = [0 100 200 300 330 380 500 800 Fmax] / Fmax;
m = [0 0 1 1 0.7 0.7 2 2 0]; % Desired magnitude response
% MATLAB function that computes the IIR filter coefficients
[b, a] = yulewalk(n, f, m);
% Ideal response superimposed with the real response obtained (order n = 10)
figure
hold on
plot(f, m, 'k'); % Ideal response
 [h1, w] = freqz(b, a, 256); % Frequency response of designed filter
% Normalize frequency axis to [0,1]
w = w / pi;
plot(w, abs(h1), 'r'); % Actual obtained response
title('Comparison Between Ideal and Designed Responses');
xlabel('Normalized Frequency'); legend('Ideal', 'Designed'); grid minor
