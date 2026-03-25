%% PRACTICE 5.10. Detection of delays using Barker sequences and correlation 

% APPLICATION TO RADAR OR SONAR USING BARKER SEQUENCES
% AS MAXIMUM AUTOCORRELATION SEQUENCES
% DEMONSTRATION IN BASEBAND (NO MODULATION)

clc; clear all; close all

%% TRANSMITTER
% GENERATION OF A 13-BIT BARKER SEQUENCE:
barker_seq = barker(13); % 13-bit Barker sequence

% Transmitted signal:
tx_signal = barker_seq;
n = length(barker_seq);

figure
stem(tx_signal)
title('Transmitted Signal (13-bit Barker Sequence)')
xlabel('Bits')
grid on

% Transmission rate:
Vtx = 1000; % [bps]

% Bit duration:
tb = 1 / Vtx;

%% SIGNAL PROPAGATION EFFECTS
% The signal experiences:
% a) A random delay (due to distance)
% b) Additive White Gaussian Noise (AWGN)

% a) RANDOM DELAY
delay = randi([30, 100], 1, 1); % delay in samples (bits)

disp(['Introduced delay to be detected: ' num2str(delay) ' samples']);

% Delayed signal (without noise):
rx_signal_clean = [zeros(1, delay) tx_signal zeros(1, 10)];

% Time axis:
t_rx = 0:tb:tb*(length(rx_signal_clean)-1);

% b) ADDITIVE WHITE GAUSSIAN NOISE
SNR = 3; % [dB]
rx_signal = awgn(rx_signal_clean, SNR, 'measured');

%% RECEIVER
figure
plot(t_rx, rx_signal)
title('Received Signal')
xlabel('Time (seconds)')
grid on

%% DETECTION USING CROSS-CORRELATION

% a) MANUAL CROSS-CORRELATION
correlation = [];

for i = 1:length(rx_signal) - n + 1
    segment = rx_signal(i:i+n-1);
    correlation(i) = sum(segment .* barker_seq);
end

% Find maximum correlation (delay estimation):
[~, I] = max(correlation);

figure
plot((0:length(correlation)-1)*tb, correlation)
title(['Estimated Delay (manual): ' num2str(I - 1) ' samples'])
xlabel('Time (seconds)')
grid on

%% b) USING MATLAB xcorr FUNCTION
[correlation_xcorr, lags] = xcorr(rx_signal, barker_seq);

% Find peak:
[~, I2] = max(correlation_xcorr);

% Convert lag to time:
t_delay = lags(I2) / Vtx;

figure
plot(lags / Vtx, correlation_xcorr)
grid on
xlabel('Lag (seconds)')
title(['Estimated Delay (xcorr): ' num2str(t_delay) ' seconds'])