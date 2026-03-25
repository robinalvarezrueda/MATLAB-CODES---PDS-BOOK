%% PRACTICE 10.1: Generation and Statistical Characterization of White Gaussian Noise

clc, clear all, close all
y = randn(1,1000); % 1000-sample vector
stem(y)
title('Discrete Signal with a Gaussian Probability Density Function')
figure
histfit(y,100) % Generates the histogram and overlays the best Gaussian fit
title('Histogram of Discrete Signal with a Gaussian Probability Density Function')
%% Measurements for VERIFICATION:
% Central tendency (arithmetic mean or average):
mean_value = mean(y);
% Dispersion (standard deviation):
std_deviation = std(y);
% Asymmetry (skewness):
skewness_value = skewness(y);
% Tail heaviness (kurtosis):
kurtosis_value = kurtosis(y);
