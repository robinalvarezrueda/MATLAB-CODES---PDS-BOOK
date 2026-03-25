function [y_statistical_normalization] = statistical_normalization(x)
[n_rows, n_columns] = size(x);
mean_value = mean(x); % Computation of the mean (central tendency)
y = x - ones(n_rows,1) * mean_value; % Removal of the central tendency
standard_deviation = std(y); % Computation of the standard deviation
y_statistical_normalization = y ./ (ones(n_rows,1) * standard_deviation); % Statistical normalization
