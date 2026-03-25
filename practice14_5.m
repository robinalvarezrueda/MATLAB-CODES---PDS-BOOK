%% PRACTICE 14.5. Training of a Neuron Using Hebb's Learning Rule

clc, close all, clear all
x = [-0.8 7]';        %Inputs X1=-0.8 y X2=7
b = [0.1];            %bias
w = [0.5  -0.67]; %Weights W1=0.5 y W2=-0.67
t = [1]; %Desired output
y=step_unit (w*x+b)  %Unit step activation function: % y =   0 

%% Hebbs Learning Algorithm:
if y==t         % No change w=w; b=b;
elseif  y==0    % Since target = 1
    w = w+x'
    b = b+1
else            % y==1   Since target=0.
   w = w-x'
    b = b-1
end
% Update degrees of freedom:  w =    -0.3000   6.3300,  b =    1.1000
% Update output:	
y= step_unit (w*x+b)  % y =     1  % already converged
