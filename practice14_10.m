%% PRÁCTICA 14.10. Complete training of an MLP using backpropagation

%% GENERALIZED TRAINING PROGRAM:
% This PROGRAM implements an MLP with a backpropagation learning algorithm trained in batch mode
% This MLP has hidden layer neurons with logistic activation functions and
% an output layer with linear activation functions.
% x: inputs as COLUMN VECTORS
% t: desired outputs (target outputs) as COLUMN VECTORS
clc, close all, clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 1. DATA SECTION (according to Fig. 14.8):
% Training set as COLUMN VECTORS
% INPUTS:
% 2 sensors, each with 4 measurements:
x = [0.4  0.8  1.3  -1.3;...
     0.7  0.9  1.8  -0.9];

% DESIRED OUTPUTS (targets) as COLUMN VECTORS
% Targets --> 4 desired outputs:
t = [0.1  0.3   0.6   0.2];
% END OF DATA SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verification of dimensional compatibility between x and t:
[inputs,numPatterns1]=size(x);
[outputs,numPatterns2]=size(t);
 
if numPatterns1 ~= numPatterns2
error('The number of input elements must be equal to the number of desired outputs.')
end

numTerms=outputs*numPatterns2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 2. Input scaling (if they are very large) -- STATISTICAL NORMALIZATION: Ec.14.39
% Normalization with respect to the maximum value:
x= x./max(x);
% % STATISTICAL NORMALIZATION:
% [xn] = statistical_normalization(x); 
% x = xn;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 3. Setting the number of neurons in the hidden layer:
% Experiment to observe its effect
numHiddenNeurons = input('How many neurons do you want in the hidden layer? '); 

%% Verification of the neural network structure:
fprintf('\nThis network has:\n\n');
fprintf(' %0.f input neurons\n', inputs);
fprintf(' %0.f neurons in the hidden layer\n', numHiddenNeurons);
fprintf(' %0.f output neurons\n\n', outputs);
fprintf('There are %0.f input/output pairs.\n\n', numPatterns2);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 4. Random initialization of network weights:
W1=0.5*randn(numHiddenNeurons, inputs+1); 
W2=0.5*randn(outputs, numHiddenNeurons+1);                      
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 5. Stopping criteria:
% First criterion: maximum number of cycles 
% Second criterion: minimum SSE
fprintf('\n\nDefault parameters:\n\n');
fprintf('Output error tolerance (SSE) = 0.1\n'); 
SSE_Desired = 0.1; 
fprintf('Maximum number of training cycles = 5000.\n'); 
numCycles = 5000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 6. Initial learning rate (Lr)
fprintf('Initial learning rate = 0.1.\n'); 
Lr = 0.1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 7. Declaration of variables to plot the error:
SSE=zeros(1,numCycles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 8. Add bias as input:
X=[ones(1,numPatterns2); x];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 9. Training loop:
for i=1:numCycles
    
    % STEP 9.1 Hidden layer output with logistic activation:
    h=logistic(W1*X);
    
    % STEP 9.2 Error evaluation (SSE)
    % Output of the hidden layer before the activation function:
    H=[ones(1,numPatterns2);h];
   
    % MLP OUTPUT:
    output = logistic(W2*H);
    
    % Output error:
    e = t-output;
    
    % Root mean squared error
    SSE(i) = sqrt(sum(sum(e.^2))/numTerms);
    
    % STEP 9.3 Stopping criterion check
    if SSE(i)<SSE_Desired
        break;
    end
    
    % STEP 9.4 Adaptive learning rate
    if SSE(i)<=SSE(max((i-1),1)) 
        Lr=Lr*1.1; 
    else 
        Lr=Lr*0.1;
    end
    
    % STEP 9.5 Update output layer weights (W2)
    % Logistic activation functions:

    % Step size for W2:
    % delta_W1= w(k+1)- w(k) = 2*Lr*(t-a)*a*(1-a)*X2;   % X2 = H'; a=output
    % delta_W1= w(k+1)- w(k) = 2*Lr*a*(1-a)*(t-a)*X2;   % X2 = H'; a=output

    delta_W2= 2*Lr*(output.*(1-output).*(t-output))*H'; % Ec.14.26.

    % Update of the output layer weights (W2)
    W2 = W2+delta_W2; 
    
    % STEP 9.6. Update of the hidden layer weights (W1):
    % Logistic activation functions:

    % Step size for W1:
    % delta_W1 = w(k+1)- w(k) = 2∙Lr.(t-a)∙a(1-a)∙W2∙h(1-h)∙X1
    % delta_W1 = w(k+1)- w(k) = 2∙Lr.h(1-h)∙W2.(t-a)∙a(1-a)∙W2∙X1
    % delta_W1 = w(k+1)- w(k) = 2∙Lr.h(1-h)∙W2∙a(1-a).(t-a)∙X1; % X1:inputs;
    delta_W1 = 2*Lr*h.*(1-h).*(W2(:,2:numHiddenNeurons+1)'*((output.*(1-output)).*(t-output)))*X'; % Ec.14.35.
    W1 = W1+delta_W1; 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 10. Plot error evolution:
SSE=nonzeros(SSE);
semilogy(SSE);
title('Backpropagation Training');
xlabel('Cycles');
ylabel('SSE Error')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 11. Convergence message:
if i<numCycles
   fprintf('Error goal reached in %i cycles.', i);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 12. Save weights at the end of training:
save trained_weights_W1_W2 W1 W2
