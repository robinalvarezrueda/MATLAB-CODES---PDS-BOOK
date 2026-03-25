%% Practice 14.3. Output of a Layer with Two Neurons.

% Form 1:
x=[6.8 14 2]'; % Inputs as a column vector
w=[ 0.1 0.2 -0.17; 0.5 -0.36 -0.45 ]; % Weight matrix as row vectors
b=[1.3 -0.8]';
y=tanh(w*x+b) 


% % Form2:
% x=[ 1 6.8 14 2]';  
% w=[1.3 0.1 0.2 -0.17; -0.8 0.5 -0.36 -0.45];
% y=tanh(w*x)  
