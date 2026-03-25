%% PRACTICE 13.2. Computation and Analysis of the Spectrogram in 2D and 3D

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


%% 4) TIME–FREQUENCY ANALYSIS
% 4.1 Spectrogram without output parameters
% Sliding window length = 5% of total signal length
L = fix(0.05 * length(yt1));
% Window type (length L):
% window = rectwin(L);
window = hann(L);
% window = blackmanharris(L);
% 50% overlap (must be an integer number of samples)
noverlap = fix(length(window)/2);
FACTOR = 256;
nFFT_window = 2^ceil(log2(length(window))) * FACTOR;
figure
subplot(2,2,1)
spectrogram(yt1, window, noverlap, nFFT_window, Fs, 'yaxis');
title('Spectrogram of PHENOMENON 1')
subplot(2,2,2)
spectrogram(yt2, window, noverlap, nFFT_window, Fs, 'yaxis');
title('Spectrogram of PHENOMENON 2')
%% 4.2 Spectrogram using output parameters + contour visualization
% --- PHENOMENON 1 ---
subplot(2,2,3)
[P1, f1, t1] = spectrogram(yt1, window, noverlap, nFFT_window, Fs, 'yaxis');
% Important: log scale improves visibility of weak components
contour(t1, f1, 10*log10(abs(P1)));
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title('Spectrogram of PHENOMENON 1 -- Contour')
% --- PHENOMENON 2 ---
subplot(2,2,4)
[P2, f2, t2] = spectrogram(yt2, window, noverlap, nFFT_window, Fs, 'yaxis');
contour(t2, f2, 10*log10(abs(P2)));
xlabel('Time (s)')
ylabel('Frequency (Hz)')
title('Spectrogram of PHENOMENON 2 -- Contour')
%% 4.3 3D Time–Frequency Representation using mesh
figure
subplot(2,1,1)
mesh(t1, f1, abs(P1))
view(160,40)
title('3D Time–Frequency Behavior – PHENOMENON 1')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
subplot(2,1,2)
mesh(t2, f2, abs(P2))
view(160,40)
title('3D Time–Frequency Behavior – PHENOMENON 2')
xlabel('Time (s)')
ylabel('Frequency (Hz)')
