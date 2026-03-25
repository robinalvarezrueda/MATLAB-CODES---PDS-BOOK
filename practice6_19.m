%% PRACTICE 6.19. Vector DFT applied to a multisinusoidal signal

clc, clear all, close all
Fmax = 125;
fs = 10*Fmax;                         % Sampling frequency
ts = 1/fs;                         % Sampling period
N = 1000;                          % Signal length (number of samples)
t = 0:ts:(N-1)*ts;                 % Time vector
% SIGNAL TO BE ANALYZED: A composite signal with six discrete frequency components (100 to 125 Hz)
xn = 1*sin(2*pi*100*t) + 0.8*sin(2*pi*105*t) + 0.6*sin(2*pi*110*t) + ...
     0.4*sin(2*pi*115*t) + 0.2*sin(2*pi*120*t) + 0.1*sin(2*pi*125*t);
% PLOTTING THE SIGNAL IN THE TIME DOMAIN
plot(t, xn, 'LineWidth', 1.5)      % Time-domain signal plot
xlabel('t (seconds)'); ylabel('Amplitude (mV)'); title('Time-Domain Signal'); grid minor
%% FREQUENCY DOMAIN ANALYSIS:
Xk = dft_vectorial(xn);            % DFT computation
magnitude_spectrum = abs(Xk);      % Magnitude of complex coefficients
normalized_magnitude_spectrum = magnitude_spectrum / max(magnitude_spectrum);
% Normalized DFT Plot:
f = linspace(0, fs, length(xn)); % Frequency axis:
figure
stem(f, normalized_magnitude_spectrum)
title('Normalized Magnitude Spectrum'), xlabel('f (Hz)')
% Visualization of the normalized DFT limited to the Nyquist range (fs/2):
figure
stem(f, normalized_magnitude_spectrum)
% Viewing the specific range where the components exist
axis([0 fs/2 0 max(normalized_magnitude_spectrum)])
title('Normalized Magnitude Spectrum - From 0 to fs/2'), xlabel('f (Hz)'), grid minor
