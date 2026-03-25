%% PRACTICE 13.1. Generation of Piecewise Defined Signals and Ideal Time-Frequency Diagram

clc; close all; clear all;
%% 1) Input Parameters of the Components
% Frequencies (ordered from lowest to highest)
f1 = 100; 
f2 = 200;
% Amplitudes
a1 = 1; 
a2 = 1;
% Time intervals – PHENOMENON 1
t11 = [0 1]; 
t12 = [1 2];
% Time intervals – PHENOMENON 2
t21 = [1 2]; 
t22 = [0 1];
%% 2) Ideal Time–Frequency Diagram
figure(1)
subplot(3,2,1)
hold on
plot(t11, [f1 f1], 'linewidth', 2)
plot(t12, [f2 f2], 'linewidth', 2)
title('IDEAL TIME–FREQUENCY DIAGRAM – PHENOMENON 1')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
axis([0 2 0 300])
legend('Amp.1: 1', 'Amp.2: 1')
grid minor
subplot(3,2,2)
hold on
plot(t21, [f1 f1], 'linewidth', 2)
plot(t22, [f2 f2], 'linewidth', 2)
title('IDEAL TIME–FREQUENCY DIAGRAM – PHENOMENON 2')
xlabel('Time (s)'), ylabel('Frequency (Hz)'), legend('Amp.1: 1', 'Amp.2: 1')
axis([0 2 0 300]), grid minor
%% 3) Generation of the Composite Signals
Fs = 10 * f2;   % Sampling frequency based on the highest frequency
Ts = 1/Fs;
duration = 2;
t = 0:Ts:duration;
% --- PHENOMENON 1 ---
comp1 = a1 * sin(2*pi*f1*t);
comp2 = a2 * sin(2*pi*f2*t);
% Zero out regions where the component does not exist
comp1 = ((t >= 0) & (t <= 1)) .* comp1;
comp2 = ((t >= 1) & (t <= 2)) .* comp2;
yt1 = comp1 + comp2;
% --- PHENOMENON 2 ---
comp1 = a1 * sin(2*pi*f1*t);
comp2 = a2 * sin(2*pi*f2*t);
comp1 = ((t >= 1) & (t <= 2)) .* comp1;
comp2 = ((t >= 0) & (t <= 1)) .* comp2;
yt2 = comp1 + comp2;
% Time-domain visualization
subplot(3,2,3)
plot(t, yt1)
title('PHENOMENON 1')
xlabel('Time (s)'), grid on
subplot(3,2,4)
plot(t, yt2)
title('PHENOMENON 2')
xlabel('Time (s)'), grid on
%% 4) Frequency-Domain Analysis
% Simple Periodogram (reference method)
N = length(yt1);
FACTOR = 1;
nFFT = 2^ceil(log2(N)) * FACTOR;
PS1 = 20*log10(abs(fft(yt1, nFFT)));
PS2 = 20*log10(abs(fft(yt2, nFFT)));
f = linspace(0, Fs, nFFT);
subplot(3,2,5)
plot(f, PS1, 'k')
title('Simple Periodogram (PHENOMENON 1)')
axis([0 Fs/2 min(PS1) max(PS1)]), xlabel('Frequency (Hz)'), grid minor
subplot(3,2,6)
plot(f, PS2, 'k')
title('Simple Periodogram (PHENOMENON 2)')
axis([0 Fs/2 min(PS2) max(PS2)]), xlabel('Frequency (Hz)'), grid minor
