%% PRACTICE 5.5. Polynomial regression without using predefined functions.

close all; clear all; clc;
% Measures of y in the time t:
t = [1 2 3 4 5]'; 
y = [5.5 43.1 128 290.7 498.4]';
% Polynomial Regression:
X = [ones(size(t))  t  t.^2 t.^3]
% Solution using the backslash operator:
a = X\y
% Now evaluate at a finer series of points:
T = (0:0.1:5)';
Y = [ones(size(T))  T  T.^2 T.^3]*a;
plot(T,Y,'-',t,y,'o')
title('Polynomial Regression Without Using polyfit'), legend('Data','Polynomial Regression'), grid on
