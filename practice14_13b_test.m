%% PRACTICE 14.13b. PROGRAM TO BE USED WITH THE TEST SET

clc, close all, clear all

%% Verification: loading already trained weights
load trained_weights_W1_W2

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% STEP 1. TEST FEATURE EXTRACTION:
%% DATA SECTION:

% % INPUTS:
Num_test = 4; % 1, 3, 6, 8, 10; % Number of vowels to be used for TRAINING, 

% Vowel a:
for i=1:1:Num_test
    name=sprintf('a%d.wav', i);
    [vowel_a{i},Fs] = audioread([pwd '\Test_vowels\', name]);
end

% Vowel e:
for i=1:1:Num_test
    name=sprintf('e%d.wav', i);
    [vowel_e{i},Fs] = audioread([pwd '\Test_vowels\', name]);
end

% Vowel i:
for i=1:1:Num_test
    name=sprintf('i%d.wav', i);
    [vowel_i{i},Fs] = audioread([pwd '\Test_vowels\', name]);
end

% Vowel o:
for i=1:1:Num_test
    name=sprintf('o%d.wav', i);
    [vowel_o{i},Fs] = audioread([pwd '\Test_vowels\', name]);
end
% Vowel u:
for i=1:1:Num_test
    name=sprintf('u%d.wav', i);
    [vowel_u{i},Fs] = audioread([pwd '\Test_vowels\', name]);
end

%% FREQUENCY DOMAIN: PERIODOGRAM CALCULATION
% Periodogram calculation:

N = length(vowel_a{1,1}); % it will be the same for the other vowels
nFFT = 2^ceil(log2(N))*1; % nFFT calculation
 
f = linspace(0, Fs, nFFT); % Frequency axis
f = f(1:nFFT/2+1); % Half-period symmetry

%%For vowel "a":

for i=1:1:Num_test

    Xn = fft(vowel_a{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);
    
    % Calculation of the 4 areas:
   
     % Band 1: (1200-1750)Hz.
    P_area=P(find(f>=1200 & f<=1750));
    Areas_A(i,1) = sum(P_area);
    B1a(i)=sum(P_area);
    
    % Band 2: (2200-2600)Hz.
    P_area=P(find(f>=2200 & f<=2600));
    Areas_A(i,2) = sum(P_area);
    B2a(i)=sum(P_area);
    
    % Band 3: (450-510)Hz.
    P_area=P(find(f>=450 & f<=510));
    Areas_A(i,3) = sum(P_area);
    B3a(i)=sum(P_area);
   
    % Band 4: (580-620)Hz.
    P_area=P(find(f>=580 & f<=620));
    Areas_A(i,4) = sum(P_area);
    B4a(i)=sum(P_area);

end 

%%For vowel "e":

for i=1:1:Num_test

    Xn = fft(vowel_e{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);
     
    % Band 1: (1200-1750)Hz.
    P_area=P(find(f>=1200 & f<=1750));
    Areas_E(i,1) = sum(P_area);
    B1e(i)=sum(P_area);
     
    % Band 2: (2200-2600)Hz.
    P_area=P(find(f>=2200 & f<=2600));
    Areas_E(i,2) = sum(P_area);
    B2e(i)=sum(P_area);
   
    % Band 3: (450-510)Hz.
    P_area=P(find(f>=450 & f<=510));
    Areas_E(i,3) = sum(P_area);
    B3e(i)=sum(P_area);
   
    % Band 4: (580-620)Hz.
    P_area=P(find(f>=580 & f<=620));
    Areas_E(i,4) = sum(P_area);
    B4e(i)=sum(P_area);

end 

%%For vowel "i":

for i=1:1:Num_test

    Xn = fft(vowel_i{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);
     
    % Band 1: (1200-1750)Hz.
    P_area=P(find(f>=1200 & f<=1750));
    Areas_I(i,1) = sum(P_area);
    B1i(i)=sum(P_area);
   
    % Band 2: (2200-2600)Hz.
    P_area=P(find(f>=2200 & f<=2600));
    Areas_I(i,2) = sum(P_area);
    B2i(i)=sum(P_area);
   
    % Band 3: (450-510)Hz.
    P_area=P(find(f>=450 & f<=510));
    Areas_I(i,3) = sum(P_area);
    B3i(i)=sum(P_area);
   
   % Band 4: (580-620)Hz.
    P_area=P(find(f>=580 & f<=620));
    Areas_I(i,4) = sum(P_area);
    B4i(i)=sum(P_area);

end 

%%For vowel "o":

for i=1:1:Num_test

    Xn = fft(vowel_o{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);
    
   % Band 1: (1200-1750)Hz.
    P_area=P(find(f>=1200 & f<=1750));
    Areas_O(i,1) = sum(P_area);
    B1o(i)=sum(P_area);
    
   % Band 2: (2200-2600)Hz.
    P_area=P(find(f>=2200 & f<=2600));
    Areas_O(i,2) = sum(P_area);
    B2o(i)=sum(P_area);
    
    % Band 3: (450-510)Hz.
    P_area=P(find(f>=450 & f<=510));
    Areas_O(i,3) = sum(P_area);
    B3o(i)=sum(P_area);
   
   % Band 4: (580-620)Hz.
    P_area=P(find(f>=580 & f<=620));
    Areas_O(i,4) = sum(P_area);
    B4o(i)=sum(P_area);

end 



%%For vowel "u":
for i=1:1:Num_test
    Xn = fft(vowel_u{i}, nFFT);
    P = abs(Xn)/max(abs(Xn));
    P = P(1:nFFT/2+1);
   
   % Band 1: (1200-1750)Hz.
    P_area=P(find(f>=1200 & f<=1750));
    Areas_U(i,1) = sum(P_area);
    B1u(i)=sum(P_area);
    
   % Band 2: (2200-2600)Hz.
    P_area=P(find(f>=2200 & f<=2600));
    Areas_U(i,2) = sum(P_area);
    B2u(i)=sum(P_area);
    
    % Band 3: (450-510)Hz.
    P_area=P(find(f>=450 & f<=510));
    Areas_U(i,3) = sum(P_area);
    B3u(i)=sum(P_area);
    
   % Band 4: (580-620)Hz.
    P_area=P(find(f>=580 & f<=620));
    Areas_U(i,4) = sum(P_area);
    B4u(i)=sum(P_area);
end 

%% All vectors B1a, B1e,.... B4u ARE ALREADY ROW VECTORS
%% STRUCTURE OF MATRIX x_test:
%        a1  a2 .... a10   e1 .. e10   ...    u1  .... u10
% B1          B1a(fila)     B1e(fila)          B1u(fila)
% B2          B2a(fila)     B2e(fila)          B2u(fila)
% B3          B3a(fila)     B3e(fila)          B3u(fila)
% B4          B4a(fila)     B4e(fila)          B4u(fila)

% VERIFICATION: Fig. 14.30 

x_test = [B1a B1e B1i B1o B1u;...
          B2a B2e B2i B2o B2u;...
          B3a B3e B3i B3o B3u;...
          B4a B4e B4i B4o B4u];

%% MLP Outputs:
Num_vowels_a = 0;
Num_vowels_e = 0;
Num_vowels_i = 0;
Num_vowels_o = 0;
Num_vowels_u = 0;

for i=1:1:Num_test*5
    output_MLP(:,i) = logistic(W2*[1;logistic(W1*[1;x_test(:,i)])]);
end

for i=1:1:Num_test*5
    
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vowels_a=Num_vowels_a+1;
    end

    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) > 0.5)
       Num_vowels_e=Num_vowels_e+1;
    end

    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) > 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vowels_i=Num_vowels_i+1;
    end

    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) > 0.5) && (output_MLP(3,i) > 0.5)
       Num_vowels_o=Num_vowels_o+1;
    end

    if (output_MLP(1,i) > 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vowels_u=Num_vowels_u+1;
    end
end

% NUMBER OF VOWELS DETECTED OF EACH TYPE:
disp(['Number of vowels recognized as "a": ',num2str(Num_vowels_a)])
disp(['Number of vowels recognized as "e": ',num2str(Num_vowels_e)])
disp(['Number of vowels recognized as "i": ',num2str(Num_vowels_i)])
disp(['Number of vowels recognized as "o": ',num2str(Num_vowels_o)])
disp(['Number of vowels recognized as "u": ',num2str(Num_vowels_u)])
