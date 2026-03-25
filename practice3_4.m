%% PRACTICE 3.4. Implementation and analysis of the sinc function

% Implementation of the sinc(t) function
% Discrete time vector:
t = -30:0.1:30;
% OPTION 1: Using MATLAB built-in function
y1 = sinc(t);
% OPTION 2: Manual implementation of the formula
y2 = sin(pi*t)./(pi*t);
y2(t == 0) = 1; % To avoid division by zero
% Plotting the signals
figure()
subplot(3,1,1)
stem(t, y1, 'Color', 'red', 'LineStyle', ':')
title('Sinc using built-in function')
xlim([-10 10])
subplot(3,1,2)
stem(t, y2, 'LineStyle', ':')
title('Sinc using mathematical definition')
xlim([-10 10])
subplot(3,1,3)
stem(t, y1, 'Color', 'yellow', 'LineStyle', '--')
hold on
stem(t, y2, 'Color', 'red', 'LineStyle', ':', 'LineWidth',1)
title('Overlaid signals')
xlim([-10 10])
