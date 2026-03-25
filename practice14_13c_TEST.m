%% PRACTICE 14.13c_TEST. VERIFICATION OF THE TRAINED MLP THROUGH CLASSIFICATION OF THE TEST SET

clc, close all, clear all

%% Reading the already trained weights
load trained_weights_W1_W2

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TEST FEATURE EXTRACTION:

% % INPUTS:
Num_test = 10; % 1, 3, 6, 8, 10; % Number of vowels to be used for TRAINING, 
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
 
%% FREQUENCY DOMAIN
% Periodogram calculation:
N = length(vowel_a{1,1});% it will be the same for the other vowels
nFFT = 2^ceil(log2(N))*1; % nFFT calculation
 
for i = 1:1:Num_test
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
% Ready to be fed into the MLP //
 
x_test = [];

% Gather the (Num_test) vowels "a"
for i = 1:1:Num_test
    x_test = [x_test P_a1_norm(:,i)];
end
%Add the (Num_test) vowels "e"
for i = 1:1:Num_test
    x_test = [x_test P_e1_norm(:,i)];
end
%Add the (Num_test) vowels "i"
for i = 1:1:Num_test
    x_test = [x_test P_i1_norm(:,i)];
end
%Add the (Num_test) vowels "o"
for i = 1:1:Num_test
    x_test = [x_test P_o1_norm(:,i)];
end
%Add the (Num_test) vowels "u"
for i = 1:1:Num_test
    x_test = [x_test P_u1_norm(:,i)];
end
%% MLP Outputs:
Num_vowels_a = 0;
Num_vowels_e = 0;
Num_vowels_i = 0;
Num_vowels_o = 0;
Num_vowels_u = 0;

for i=1:1:Num_test*5 % MAXIMUM is 100 vowels to test in total (10 OF EACH TYPE)
    output_MLP(:,i) = logistic(W2*[1;logistic(W1*[1;x_test(:,i)])])';
end

for i=1:1:Num_test*5    % MAXIMUM is 100 vowels to test in total (10 OF EACH TYPE)
    % To be A: 0 0 0
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vowels_a=Num_vowels_a+1;
    end
    % To be E: 0 0 1
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) > 0.5)
       Num_vowels_e=Num_vowels_e+1;
    end
    % To be I: 0 1 0
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) > 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vowels_i=Num_vowels_i+1;
    end
    % To be O: 0 1 1
    if (output_MLP(1,i) <= 0.5) && (output_MLP(2,i) > 0.5) && (output_MLP(3,i) > 0.5)
       Num_vowels_o=Num_vowels_o+1;
    end
    % To be U: 1 0 0
    if (output_MLP(1,i) > 0.5) && (output_MLP(2,i) <= 0.5) && (output_MLP(3,i) <= 0.5)
       Num_vowels_u=Num_vowels_u+1;
    end

end
% CALCULATION OF THE RECOGNITION SYSTEM ACCURACY:
Error_vowels_a = abs(Num_test-Num_vowels_a);
Error_vowels_e = abs(Num_test-Num_vowels_e);
Error_vowels_i = abs(Num_test-Num_vowels_i);
Error_vowels_o = abs(Num_test-Num_vowels_o);
Error_vowels_u = abs(Num_test-Num_vowels_u);
Total_error = Error_vowels_a + Error_vowels_e + Error_vowels_i + Error_vowels_o + Error_vowels_u;

Total = Num_test *5;
correct = Total - Total_error; 
accuracy = (correct/Total)*100;
disp(['The recognition system accuracy is: ',num2str(accuracy), '%'])
