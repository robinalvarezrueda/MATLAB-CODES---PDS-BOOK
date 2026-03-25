%% Practice 14.1. Evaluation of activation functions


clc,close all, clear all
x=[-5:0.1:5]; % Evaluation interval
%Linear function
y1=linear(x);
subplot(2,2,1)
plot(x,y1)
title('Linear activation function')
xlabel('x'); ylabel('Linear(x)'), grid minor
%Logistic or sigmoid function:
y2=logistic(x);
subplot(2,2,2)
plot(x,y2)
title('Logistic or sigmoid activation function')
xlabel('x'); ylabel('Logistic(x)'), grid minor
%Hyperbolic tangent function (built in Matlab function):
y3=tanh(x);
subplot(2,2,3)
plot(x,y3)
title('Hyperbolic tangent activation function')
xlabel('x'); ylabel('Tanh(x)'), grid minor
%Step function:
y4=step_unit(x);
subplot(2,2,4)
plot(x,y4);
title('Step activation function')
xlabel('x'); ylabel('Paso(x)'), grid minor
