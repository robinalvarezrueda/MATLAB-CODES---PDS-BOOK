%% PRACTICE 12.5. Comparison Between IIR and FIR Digital Filters in Terms of Quality and Phase

clc; close all; clear all;
%% Generation of a Three-Tone Signal
Fmax = 160;
Fs = 10 * Fmax;
t = 0:1/Fs:5;
x = sin(2*pi*100*t) + ...
    sin(2*pi*120*t) + ...
    sin(2*pi*140*t);
subplot(2,1,1)
plot(t, x)
title('Original Time-Domain Signal')
xlabel('Time (s)')
ylabel('Amplitude')
%% Frequency Domain
N = length(x);
FACTOR = 256;
nFFT = 2^ceil(log2(N)) * FACTOR; % FFT length calculation
X = fft(x, nFFT);
% Magnitude spectrum (Periodogram)
Periodogram = abs(X);
% Frequency axis
f = linspace(0, Fs, nFFT);
subplot(2,1,2)
plot(f, Periodogram)
axis([0 Fs/2 0 max(Periodogram)])
xlabel('Frequency (Hz)')
title('Periodogram of the Original Signal')
%% LOW-PASS FILTER: passes only the 100 Hz component
f1 = [0 110 115 (Fs/2)] / (Fs/2);
m1 = [1 1 0 0];
% IIR Filter (Yule-Walker)
order_IIR = 40;
[b1, a1] = yulewalk(order_IIR, f1, m1);
% FIR Filter (Remez / Parks-McClellan)
order_FIR = 100;
b2 = remez(order_FIR, f1, m1);
%% Ideal vs Designed Frequency Responses
w = (1:256)/256;
h1 = freqz(b1, a1, 256);
h2 = freqz(b2, 1, 256);
figure
subplot(2,1,1)
hold on
plot(f1, m1, 'k')           % Ideal response
plot(w, abs(h1), 'r')       % Designed response
xlabel('Normalized Frequency')
ylabel('Gain')
title('IIR Low-Pass Filter (Order = 40): Ideal vs Designed')
legend('Ideal', 'Designed')
grid minor
subplot(2,1,2)
hold on
plot(f1, m1, 'k')
plot(w, abs(h2), 'r')
xlabel('Normalized Frequency')
ylabel('Gain')
title('FIR Low-Pass Filter (Order = 100): Ideal vs Designed')
legend('Ideal', 'Designed')
grid minor
%% Bode Diagrams (Magnitude and Phase)
figure
freqz(b1, a1, 256)
title('Bode Diagram – IIR Filter')
figure
freqz(b2, 1, 256)
title('Bode Diagram – FIR Filter')
%% Filtered Signals
filtered_IIR = filter(b1, a1, x);
filtered_FIR = filter(b2, 1, x);
%% Frequency-Domain Verification
X1 = fft(filtered_IIR, nFFT);
P1 = abs(X1);
X2 = fft(filtered_FIR, nFFT);
P2 = abs(X2);
figure
subplot(2,1,1)
plot(f, P1)
axis([0 Fs/2 0 max(P1)])
xlabel('Frequency (Hz)')
title('Periodogram of Signal Filtered with IIR (Order 40)')
subplot(2,1,2)
plot(f, P2)
axis([0 Fs/2 0 max(P2)])
xlabel('Frequency (Hz)')
title('Periodogram of Signal Filtered with FIR (Order 100)')
%% Time-Domain Results
figure
subplot(2,1,1)
plot(t, filtered_IIR)
title('Signal Filtered with IIR')
xlabel('Time (s)')
ylabel('Amplitude')
grid minor
subplot(2,1,2)
plot(t, filtered_FIR)
title('Signal Filtered with FIR')
xlabel('Time (s)')
ylabel('Amplitude')
grid minor
