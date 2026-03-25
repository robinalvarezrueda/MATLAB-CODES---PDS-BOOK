%% PRACTICE 6.21. USING THE MATLAB FFT FUNCTION

clc, close all, clear all
%% SIGNAL CONSTRUCTION 
% Signal duration
duration = 1;
f1 = 10; % First frequency component
f2 = 20; % Second frequency component
fs = 10 * f2; % Sampling Theorem: Using a factor of 10 relative to the highest frequency
ts = 1 / fs; % Sampling period
t = 0:ts:duration; % Time vector
xn = sin(2*pi*f1*t) + sin(2*pi*f2*t); % Original signal sin(10) + sin(20)
%% FREQUENCY DOMAIN
% Number of samples in the signal 
N = length(xn);   
% Calculate the nearest power of 2 and multiply by a factor 
% to increase the number of samples (Zero-Padding) for a smoother result.
nFFT = 2^(ceil(log2(N))) * 128; 
% Apply the MATLAB FFT function to compute the complex coefficients.
Xn1 = fft(xn, nFFT);
% Compute the magnitude of the complex coefficients, known as the PERIODOGRAM.
periodogram = abs(Xn1);
% Frequency axis calculation: same number of points as the periodogram, 
% mapped between 0 and fs.
f = linspace(0, fs, nFFT);
% Plotting the results:
plot(f, periodogram);
% Due to half-period symmetry, we only visualize the first half of the periodogram:
axis([0 fs/2 0 max(periodogram)]), title('Periodogram based on MATLAB FFT'), xlabel('Frequency (Hz)')
