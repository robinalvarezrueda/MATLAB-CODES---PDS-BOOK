%% PRACTICE 10.3. Implementation of a Custom AWGN Generator and Statistical Validation

function [y_noisy] = my_awgn(x, SNR)
% my_awgn adds noise to signal x
% and returns the noisy signal
% SNR is specified in dB
N = length(x); % Signal length
P_x = sum(abs(x.^2))/N; % Average signal power (Parseval's theorem)
SNR_linear = 10^(SNR/10); % Convert SNR to linear scale
No = P_x/SNR_linear; % Noise power spectral density
% Considering a real-valued signal x:
sigma_noise = sqrt(No); % Standard deviation of AWGN noise
noise = sigma_noise*randn(1,N); % Noise generation
% Add the computed noise to the original signal
y_noisy = x + noise;
end
