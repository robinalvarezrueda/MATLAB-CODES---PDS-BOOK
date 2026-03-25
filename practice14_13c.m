%% PRACTICE 14.13c. TRAINING PROGRAM 

clc, close all, clear all
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 1. Network structure (according to Fig. 4.8):
% Training set as COLUMN VECTORS
%% DATA SECTION:
% % INPUTS:
Num_training = 10; % 1, 3, 6, 8, 10; % Number of vowels that will be used for TRAINING, 
% Vowel a:
for i=1:1:Num_training
    name=sprintf('a%d.wav', i);
    [vowel_a{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end
% Vowel e:
for i=1:1:Num_training
    name=sprintf('e%d.wav', i);
    [vowel_e{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end
% Vowel i:
for i=1:1:Num_training
    name=sprintf('i%d.wav', i);
    [vowel_i{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end
% Vowel o:
for i=1:1:Num_training
    name=sprintf('o%d.wav', i);
    [vowel_o{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end
% Vowel u:
for i=1:1:Num_training
    name=sprintf('u%d.wav', i);
    [vowel_u{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end
%% FREQUENCY DOMAIN
% Periodogram calculation:
N = length(vowel_a{1,1}); % it will be the same for the other vowels
nFFT = 2^ceil(log2(N))*1; % nFFT calculation

for i = 1:1:Num_training
    A1 = fft(vowel_a{1,i}, nFFT); % FFT calculation
    P_a1= abs(A1)/max(abs(A1)); % Normalization
    P_a1_norm(:,i) = P_a1(1:nFFT/2+1); % Extraction of half of the spectrum
 
    E1 = fft(vowel_e{1,i}, nFFT); % FFT calculation
    P_e1 = abs(E1)/max(abs(E1)); % Normalization
    P_e1_norm(:,i) = P_e1(1:nFFT/2+1); % Extraction of half of the spectrum
 
    I1 = fft(vowel_i{1,i}, nFFT); % FFT calculation
    P_i1 = abs(I1)/max(abs(I1)); % Normalization
    P_i1_norm(:,i) = P_i1(1:nFFT/2+1); % Extraction of half of the spectrum
 
    O1 = fft(vowel_o{1,i}, nFFT); % FFT calculation
    P_o1 = abs(O1)/max(abs(O1)); % Normalization
    P_o1_norm(:,i) = P_o1(1:nFFT/2+1); % Extraction of half of the spectrum
 
    U1 = fft(vowel_u{1,i}, nFFT); % FFT calculation
    P_u1 = abs(U1)/max(abs(U1)); % Normalization
    P_u1_norm(:,i) = P_u1(1:nFFT/2+1); % Extraction of half of the spectrum
end
% All normalized periodograms are already COLUMN VECTORS //
% Ready to be used in the MLP training //
x = [];
% We gather the (Num_training) vowels "a"
for i = 1:1:Num_training
    x = [x P_a1_norm(:,i)];
end
% Add the (Num_training) vowels "e"
for i = 1:1:Num_training
    x = [x P_e1_norm(:,i)];
end
% Add the (Num_training) vowels "i"
for i = 1:1:Num_training
    x = [x P_i1_norm(:,i)];
end
% Add the (Num_training) vowels "o"
for i = 1:1:Num_training
    x = [x P_o1_norm(:,i)];
end
% Add the (Num_training) vowels "u"
for i = 1:1:Num_training
    x = [x P_u1_norm(:,i)];
end
%% Desired outputs as COLUMN VECTORS: Output in non-binary mode 
aa=[0 0 0]';
ee=[0 0 1]';
ii=[0 1 0]';
oo=[0 1 1]';
uu=[1 0 0]';
% aa=[0 0 0 0 0]';
% ee=[0 0 0 1 0]';
% ii=[0 0 1 0 0]';
% oo=[0 1 0 0 0]';
% uu=[1 0 0 0 0]';
t_a=[repmat(aa,1, Num_training)];
t_e=[repmat(ee,1, Num_training)];
t_i=[repmat(ii,1, Num_training)];
t_o=[repmat(oo,1, Num_training)];
t_u=[repmat(uu,1, Num_training)];
t=[t_a t_e t_i t_o t_u];

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

