
%% PRACTICE 6.1. Orthogonality of sine functions.

clc; close all; clear all;

% Define harmonic indices m and n
m = 3; % Integer index of the first sinusoidal component
n = 4; % Integer index of the second sinusoidal component
L = pi; % Define half-period L (Full period T = 2L)
% Generate the abscissa vector x over the interval [-L, L]
x = linspace(-L, L, 1000);
% Define the two sinusoidal basis functions
f1 = sin(m * pi * x / L);  % sin(3πx/L)
f2 = sin(n * pi * x / L);  % sin(4πx/L)
% Compute the element-wise product (integrand)
product_val = f1 .* f2;
% Isolate positive and negative regions for visualization
positive_part = product_val;
positive_part(positive_part < 0) = 0;
negative_part = product_val;
negative_part(negative_part > 0) = 0;
% Visualization of the product and its constituent areas
figure; hold on;
area(x, positive_part, 'FaceColor', 'b', 'EdgeColor', 'none');  % Blue: Positive area
area(x, negative_part, 'FaceColor', 'r', 'EdgeColor', 'none');  % Red: Negative area
plot(x, product_val, 'k', 'LineWidth', 1.2);                   % Product waveform
xlabel('x'); ylabel('sin(3\pi x/L) \cdot sin(4\pi x/L)');
title('Inner Product Visualization: sin(3\pi x/L) and sin(4\pi x/L)'); grid on;
% Define the product as an anonymous function for numerical integration
f_integrand = @(x) sin(m * pi * x / L) .* sin(n * pi * x / L);
% Compute the definite integral over the interval [-L, L]
result = integral(f_integrand, -L, L);
% Display the inner product result
disp(['Inner product result: ', num2str(result)]);
