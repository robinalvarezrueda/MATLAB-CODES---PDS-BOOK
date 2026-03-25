%% PRACTICE 12.3. Filtering With and Without the Use of MATLAB's filter Function

clc; close all; clear all;

%% Generation of a three-tone signal
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

%% Frequency Domain Analysis
N = length(x);
FACTOR = 256;
nFFT = 2^ceil(log2(N)) * FACTOR; % FFT length
X = fft(x, nFFT);
Periodogram = abs(X);

% Frequency axis
f = linspace(0, Fs, nFFT);
subplot(2,1,2)
plot(f, Periodogram)
axis([0 Fs/2 0 max(Periodogram)])
xlabel('Frequency (Hz)')
title('Periodogram of the Original Signal')

%% IIR LOW-PASS FILTER
% Designed to pass only the 100 Hz component

% 1) Using MATLAB FILTER command
f1 = [0 110 115 (Fs/2)] / (Fs/2); 
m1 = [1 1 0 0];
order = 10;
[b, a] = yulewalk(order, f1, m1);
filtered_signal_filter = filter(b, a, x);

%% 2) Manual implementation (without using FILTER)
% Zero-padding according to filter order
xn = [zeros(1, order), x];
% Output buffer
y_aux = zeros(1, length(xn));
y_out = 0;
% Solve the difference equation
for k = order+2:length(x)
    for i = 1:length(a)-1
        y_out = (b(i)*xn(k-i+1)) ...
              - (a(i+1)*y_aux(k-i)) ...
              + y_out;
    end
    y_aux(k) = y_out;
    y_out = 0;
end
% Remove initial conditions
filtered_signal_manual = y_aux(order+1:end);
%% Time-domain comparison

figure
subplot(2,1,1)
plot(t, filtered_signal_filter)
grid minor
title('Filtered Signal USING filter()')
xlabel('Time (s)')
ylabel('Amplitude')
subplot(2,1,2)
plot(t, filtered_signal_manual)
grid minor
title('Filtered Signal WITHOUT filter()')
xlabel('Time (s)')
ylabel('Amplitude')

%% Frequency-domain verification
X1 = fft(filtered_signal_filter, nFFT);
P1 = abs(X1);
P1_norm = P1 / max(P1);
X2 = fft(filtered_signal_manual, nFFT);
P2 = abs(X2);
P2_norm = P2 / max(P2);

figure
hold on
plot(f, P1_norm, 'b')
plot(f, P2_norm, 'r:')
xlim([0 Fs/2])
xlabel('Frequency (Hz)')
title('Periodogram: Using filter() vs Manual Implementation')
legend('Using filter()', 'Manual implementation')
grid minor
