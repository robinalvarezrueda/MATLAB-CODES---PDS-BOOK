%% Practice 14.2. Computation of the Output of an Artificial Neuron.

%Scheme 1:
x = [1 7 9]'; % Inputs as a column vector
w = [0.65 0.23 -0.14]; % Weights as a row vector
b = - 0.4;
y = tanh(w*x+b) % Neuron output

%Scheme 2:
x = [1 1 7 9]';
b = -0.4;
w = [b 0.65 0.23 -0.14];
% Neuron output:
y = tanh(w*x) 
