%% PRÁCTICA 14.4. Evaluation of an MLP with one hidden layer.

x=[3 5 7]';
w1=[2 -1.5 1; 2.5 1.2 -2.3; 12 -11.4 0.8];
w2=[0.11 -0.36 0.27; 0.32 -0.16 -0.15];  
b1=[-0.6 0.8 1.3 ]'; b2=[0.8 -1.7]';
y=w2*tanh(w1*x+b1)+b2 
