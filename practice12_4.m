%% PRACTICE 12.4. Use of All Basic Filters

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
% Magnitude of the FFT (Periodogram)
Periodogram = abs(X);
% Frequency axis
f = linspace(0, Fs, nFFT);
subplot(2,1,2)
plot(f, Periodogram)
axis([0 Fs/2 0 max(Periodogram)])
xlabel('Frequency (Hz)')
title('Periodogram of the Original Signal')

%% REQUESTED FILTERS
order = 50;
% 1) LOW-PASS FILTER: passes only the 100 Hz component
f1 = [0 110 115 (Fs/2)] / (Fs/2);
m1 = [1 1 0 0];
[b1, a1] = yulewalk(order, f1, m1);

% 2) BAND-PASS FILTER: passes only the 120 Hz component
f2 = [0 110 115 125 130 (Fs/2)] / (Fs/2);
m2 = [0 0 1 1 0 0];
[b2, a2] = yulewalk(order, f2, m2);

% 3) HIGH-PASS FILTER: passes only the 140 Hz component
f3 = [0 125 130 (Fs/2)] / (Fs/2);
m3 = [0 0 1 1];
[b3, a3] = yulewalk(order, f3, m3);

% 4) BAND-STOP (NOTCH) FILTER: eliminates only the 120 Hz component
f4 = [0 110 115 125 130 (Fs/2)] / (Fs/2);
m4 = [1 1 0 0 1 1];
[b4, a4] = yulewalk(order, f4, m4);

%% Ideal vs Designed Frequency Responses
w = (1:256)/256;
h1 = freqz(b1, a1, 256);
h2 = freqz(b2, a2, 256);
h3 = freqz(b3, a3, 256);
h4 = freqz(b4, a4, 256);
figure
subplot(2,2,1)
hold on
plot(f1, m1, 'k')
plot(w, abs(h1), 'r')
xlabel('Normalized Frequency')
ylabel('Gain')
title('Low-Pass Filter (Ideal vs Designed), Order = 50')
legend('Ideal', 'Designed')
grid minor
subplot(2,2,2)
hold on
plot(f2, m2, 'k')
plot(w, abs(h2), 'r')
xlabel('Normalized Frequency')
ylabel('Gain')
title('Band-Pass Filter (Ideal vs Designed), Order = 50')
legend('Ideal', 'Designed')
grid minor
subplot(2,2,3)
hold on
plot(f3, m3, 'k')
plot(w, abs(h3), 'r')
xlabel('Normalized Frequency')
ylabel('Gain')
title('High-Pass Filter (Ideal vs Designed), Order = 50')
legend('Ideal', 'Designed')
grid minor
subplot(2,2,4)
hold on
plot(f4, m4, 'k')
plot(w, abs(h4), 'r')
xlabel('Normalized Frequency')
ylabel('Gain')
title('Band-Stop Filter (Ideal vs Designed), Order = 50')
legend('Ideal', 'Designed')
grid minor

%% Filtered Signals Using filter()
filtered_1 = filter(b1, a1, x);
filtered_2 = filter(b2, a2, x);
filtered_3 = filter(b3, a3, x);
filtered_4 = filter(b4, a4, x);
%% Frequency-Domain Verification
X1 = fft(filtered_1, nFFT);
P1 = abs(X1);
X2 = fft(filtered_2, nFFT);
P2 = abs(X2);
X3 = fft(filtered_3, nFFT);
P3 = abs(X3);
X4 = fft(filtered_4, nFFT);
P4 = abs(X4);
figure
subplot(2,2,1)
plot(f, P1)
axis([0 Fs/2 0 max(P1)])
xlabel('Frequency (Hz)')
title('Periodogram of Filtered Signal 1')
subplot(2,2,2)
plot(f, P2)
axis([0 Fs/2 0 max(P2)])
xlabel('Frequency (Hz)')
title('Periodogram of Filtered Signal 2')
subplot(2,2,3)
plot(f, P3)
axis([0 Fs/2 0 max(P3)])
xlabel('Frequency (Hz)')
title('Periodogram of Filtered Signal 3')
subplot(2,2,4)
plot(f, P4)
axis([0 Fs/2 0 max(P4)])
xlabel('Frequency (Hz)')
title('Periodogram of Filtered Signal 4')
%% Time-Domain Results
figure
subplot(2,2,1)
plot(t, filtered_1)
title('Filtered Signal 1')
xlabel('Time (s)')
ylabel('Amplitude')
grid minor
subplot(2,2,2)
plot(t, filtered_2)
title('Filtered Signal 2')
xlabel('Time (s)')
ylabel('Amplitude')
grid minor
subplot(2,2,3)
plot(t, filtered_3)
title('Filtered Signal 3')
xlabel('Time (s)')
ylabel('Amplitude')
grid minor
subplot(2,2,4)
plot(t, filtered_4)
title('Filtered Signal 4')
xlabel('Time (s)')
ylabel('Amplitude')
grid minor
