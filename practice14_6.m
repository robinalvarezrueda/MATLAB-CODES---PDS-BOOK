%% PRACTICE 14.6. Supervised Training of a Perceptron.

x = [0 1; 1 -1]
t=[0 1];
w=[-0.1 0.8]; b=[-.5];
y=paso(w*x+b)  
 
% The degrees of freedom must be updated so that the network produces the desired output
% Hebb's rule must be applied for each output y(i):
[inputs,patterns]=size(x);
 
% Repeat the loop as many times as data points:
for i=1: patterns
   if y(i)==t(i)    % Already converged: w=w; b=b; 
 
   elseif  y(i)==0   % Target = 1
     w = w+x(:,i)'
     b = b+1
   else   % y=1 target=0. 
     w = w-x(:,i)'
     b = b-1
  end
end
 y=paso(w*x+b)
