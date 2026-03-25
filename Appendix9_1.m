%% Appendix 9.1

clc; clear all; close all;
f1 = 100;
duration = 0.1;
Fmax = f1;
Fs = 10 * Fmax; 
Ts = 1 / Fs;
% Time base (discrete)
n = 0:Ts:duration;
% Amplitude vector
x1 = sin(2*pi*f1*n); % Simulates the "infinite" signal
% Rectangular window:
x2 = zeros(1, length(x1));
x2(30:80) = 1;
% Plot (time domain)
subplot(3,1,1)
plot(n, x1)
grid on; grid minor
title('Time Domain Graph');
xlabel('t [s]');
ylabel('Amplitude');
subplot(3,1,2)
plot(x2)
grid on; grid minor
title('Rectangular Window');
subplot(3,1,3)
x3 = x1 .* x2;
plot(n, x3)
grid on; grid minor
title('Time Domain Graph');
xlabel('t [s]');
ylabel('Amplitude');
