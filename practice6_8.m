%% PRACTICE 6.8. Complex Fourier Series of a Square Wave

clc; clear all; close all;
% Prompt user for the number of frequency components to analyze:
num_components = input('Enter the number of frequency components to consider: ');
% Define the discrete frequency axis (from -n to n):
f_axis = -num_components:1:num_components; 
Ymax = 1; % Peak signal amplitude
% Initialize the vector for Complex Fourier Coefficients (Cn):
Cn = zeros(1, length(f_axis));
% Compute Complex Fourier Coefficients (Cn) iteratively:
for n = -num_components:1:num_components
    if n == 0
        % DC component (average value) for a bipolar square wave is zero:
        Cn(num_components + n + 1) = 0;
    else
        % Implementation of the derived analytical formula for Cn:
        Cn(num_components + n + 1) = ((-1j * Ymax) / (n * pi)) * (1 - (-1)^n);
    end
end
% Compute the Magnitude Spectrum (Absolute value of complex coefficients):
magnitude = abs(Cn); 
% Normalize the spectrum for relative amplitude analysis:
normalized_magnitude = magnitude / max(magnitude);
% Visualization of the Discrete Amplitude Spectrum:
stem(f_axis, normalized_magnitude, 'r', 'filled');
grid on;
title('Normalized Amplitude Spectrum of a Square Wave');
xlabel('Frequency Index (n \cdot f_0)');
ylabel('Normalized Magnitude |C_n|');
% Adjust view to show only the positive frequency range:
xlim([0 num_components]);

