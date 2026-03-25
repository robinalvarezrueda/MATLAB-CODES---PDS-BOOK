%% PRACTICE 14.12: APPLICATION TO LETTER RECOGNITION – TRAINING 

% %INPUTS:
%% Inputs: individual letters as COLUMN VECTORS:
A=[0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
B=[1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0]';
C=[1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1]';
D=[1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0]';
E=[1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1]';
F=[1 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0]';
G=[0 1 1 1 1 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 1 1 1 0 0 0 1 0 1 1 1 1]';
H=[1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
I= [0 1 1 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 1 1 0]';
J=[0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 0 0 0 1 0 1 1 1 0]';
K=[1 0 0 0 1 1 0 0 1 0 1 0 1 0 0 1 1 0 0 0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1]';
L=[1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 1 1 1]';
M=[1 0 0 0 1 1 1 0 1 1 1 0 1 0 1 1 0 1 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
N=[1 0 0 0 1 1 0 0 0 1 1 1 0 0 1 1 0 1 0 1 1 0 0 1 1 1 0 0 0 1 1 0 0 0 1]';
O=[0 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 0 1 1 1 0]';
P=[1 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0]';
Q=[0 1 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 1 0 1 1 0 0 1 0 0 1 1 0 1]';
R=[1 1 1 1 1 1 0 0 0 1 1 0 0 0 1 1 1 1 1 0 1 0 1 0 0 1 0 0 1 0 1 0 0 0 1]';
S=[0 1 1 1 0 1 0 0 0 1 1 0 0 0 0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 1 1 1 1 1 1]';
T=[1 1 1 1 1 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0]';
U=[1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 0 1 1 1 0]';
V=[1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0]';
W=[1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 1 0 1 1 0 1 0 1 1 1 0 1 1 1 0 0 0 1]';
X=[1 0 0 0 1 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 1 0 0 0 1]';
Y=[1 0 0 0 1 1 0 0 0 1 0 1 1 1 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0]';
Z=[1 1 1 1 1 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 1 1 1 1 1]';
% Creation of the input matrix
x=[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z];
%% Desired outputs as COLUMN VECTORS
t=[0 0 0 0 0; %A
   0 0 0 0 1; %B
   0 0 0 1 0; %C
   0 0 0 1 1; %D
   0 0 1 0 0; %E
   0 0 1 0 1; %F
   0 0 1 1 0; %G
   0 0 1 1 1; %H
   0 1 0 0 0; %I
   0 1 0 0 1; %J
   0 1 0 1 0; %K
   0 1 0 1 1; %L
   0 1 1 0 0; %M
   0 1 1 0 1; %N
   0 1 1 1 0; %O
   0 1 1 1 1; %P
   1 0 0 0 0; %Q
   1 0 0 0 1; %R
   1 0 0 1 0; %S
   1 0 0 1 1; %T
   1 0 1 0 0; %U
   1 0 1 0 1; %V
   1 0 1 1 0; %W
   1 0 1 1 1; %X
   1 1 0 0 0; %Y
   1 1 0 0 1 %Z
   ]';

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
