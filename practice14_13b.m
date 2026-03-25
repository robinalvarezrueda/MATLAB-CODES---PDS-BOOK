%% PRACTICE 14.13b: TRAINING PROGRAM — DATA SECTION ONLY

clc, close all, clear all

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 1. BEGINNING OF THE DATA SECTION (according to Fig. 4.8):
% Training set as COLUMN VECTORS

% % INPUTS:
Num_training = 10; % 1, 3, 6, 8, 10; % Number of vowels to be used for TRAINING

% Vowel a:
for i=1:1:Num_training
    name=sprintf('a%d.wav', i);
    [vowel_a{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end

% Vowel e
for i=1:1:Num_training
    name=sprintf('e%d.wav', i);
    [vowel_e{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end

% Vowel i
for i=1:1:Num_training
    name=sprintf('i%d.wav', i);
    [vowel_i{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end

% Vowel o
for i=1:1:Num_training
    name=sprintf('o%d.wav', i);
    [vowel_o{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end

% Vowel u
for i=1:1:Num_training
    name=sprintf('u%d.wav', i);
    [vowel_u{i},Fs] = audioread([pwd '\Training_vowels\', name]);
end

%% FREQUENCY DOMAIN: PERIODOGRAM CALCULATION
% Periodogram calculation:
N = length(vowel_a{1,1}); % same for the other vowels
nFFT = 2^ceil(log2(N))*1; % nFFT calculation
 
f = linspace(0, Fs, nFFT); % Frequency axis
f = f(1:nFFT/2+1); % Half-period symmetry

%% For vowel "a":
for i=1:1:Num_training
    Xn = fft(vowel_a{i}, nFFT); % Complex FFT calculation
    P = abs(Xn)/max(abs(Xn)); % Normalized periodogram
    P = P(1:nFFT/2+1); % Extract half of the spectrum
    
    % Calculation of the 4 areas:
    % Band 1: (1200-1750) Hz
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_A(i,1) = sum(P_Area);
    B1a(i)=sum(P_Area);
    % Band 2: (2200-2600) Hz
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_A(i,2) = sum(P_Area);
    B2a(i)=sum(P_Area);
    % Band 3: (450-510) Hz
    P_Area=P(find(f>=450 & f<=510));
    Areas_A(i,3) = sum(P_Area);
    B3a(i)=sum(P_Area);
    % Band 4: (580-620) Hz
    P_Area=P(find(f>=580 & f<=620));
    Areas_A(i,4) = sum(P_Area);
    B4a(i)=sum(P_Area);
end 

%% For vowel "e":
for i=1:1:Num_training
    Xn = fft(vowel_e{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);
 
    % 4 area calculations
    % Band 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_E(i,1) = sum(P_Area);
    B1e(i)=sum(P_Area);
    % Band 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_E(i,2) = sum(P_Area);
    B2e(i)=sum(P_Area);
    % Band 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_E(i,3) = sum(P_Area);
    B3e(i)=sum(P_Area);
    % Band 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_E(i,4) = sum(P_Area);
    B4e(i)=sum(P_Area);
end 
     
%% For vowel "i":
for i=1:1:Num_training
    Xn = fft(vowel_i{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);

    % 4 area calculations
    % Band 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_I(i,1) = sum(P_Area);
    B1i(i)=sum(P_Area);
    % Band 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_I(i,2) = sum(P_Area);
    B2i(i)=sum(P_Area);
    % Band 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_I(i,3) = sum(P_Area);
    B3i(i)=sum(P_Area);
    % Band 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_I(i,4) = sum(P_Area);
    B4i(i)=sum(P_Area);
end 
     
%% For vowel "o":
for i=1:1:Num_training
    Xn = fft(vowel_o{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);
    % 4 area calculations
    % Band 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_O(i,1) = sum(P_Area);
    B1o(i)=sum(P_Area);
    % Band 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_O(i,2) = sum(P_Area);
    B2o(i)=sum(P_Area);
    % Band 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_O(i,3) = sum(P_Area);
    B3o(i)=sum(P_Area);
    % Band 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_O(i,4) = sum(P_Area);
    B4o(i)=sum(P_Area);
end 
    
%% For vowel "u":
for i=1:1:Num_training
    Xn = fft(vowel_u{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);
% 4 area calculations
    % Band 1: (1200-1750)Hz.
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_U(i,1) = sum(P_Area);
    B1u(i)=sum(P_Area);
    % Band 2: (2200-2600)Hz.
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_U(i,2) = sum(P_Area);
    B2u(i)=sum(P_Area);
    % Band 3: (450-510)Hz.
    P_Area=P(find(f>=450 & f<=510));
    Areas_U(i,3) = sum(P_Area);
    B3u(i)=sum(P_Area);
    % Band 4: (580-620)Hz.
    P_Area=P(find(f>=580 & f<=620));
    Areas_U(i,4) = sum(P_Area);
    B4u(i)=sum(P_Area);
end 
%% All vectors B1a, B1e, ... B4u are already ROW VECTORS
%% STRUCTURE OF MATRIX x:
%          a1  a2 .... a10        e1 .. e10   ...    u1  .... u10
% B1          B1a(row)            B1e(row)            B1u(row)
% B2          B2a(row)            B2e(row)            B2u(row)
% B3          B3a(row)            B3e(row)            B3u(row)
% B4          B4a(row)            B4e(row)            B4u(row)

% VERIFICATION: Fig. 4.27
x = [B1a B1e B1i B1o B1u;...
     B2a B2e B2i B2o B2u;...
     B3a B3e B3i B3o B3u;...
     B4a B4e B4i B4o B4u];
% VERIFIED according to Fig. 3.30
% (tested even with all 10 files: Num_training = 10)

%% Desired outputs as COLUMN VECTORS:
% Output in non-binary mode
aa=[0 0 0]';
ee=[0 0 1]';
ii=[0 1 0]';
oo=[0 1 1]';
uu=[1 0 0]';
% % aa=[0 0 0 0 0]';
% % ee=[0 0 0 1 0]';
% % ii=[0 0 1 0 0]';
% % oo=[0 1 0 0 0]';
% % uu=[1 0 0 0 0]';

t_a=[repmat(aa,1, Num_training)];
t_e=[repmat(ee,1, Num_training)];
t_i=[repmat(ii,1, Num_training)];
t_o=[repmat(oo,1, Num_training)];
t_u=[repmat(uu,1, Num_training)];
t=[t_a t_e t_i t_o t_u];

% END OF DATA SECTION
% CONVERGENCE VERIFIED with error = 0.1 for all cases of Num_training
% No normalization was required

% CONTINUE WITH THE REST OF PRACTICE 14.10 CODE
% after END OF DATA SECTION
% Then, copy here from the following code:
% Verification of dimensional compatibility between x and t:
%[inputs,patterns1]=size(x);
%[outputs,patterns2]=size(t);


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
