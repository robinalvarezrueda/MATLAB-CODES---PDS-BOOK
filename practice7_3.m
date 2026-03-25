%% PRACTICE 7.3. Comparison of computational load between direct DFT, custom FFT, and MATLAB FFT

clc , clear all, close all
% Number of samples entered by the user
Factor = input('Enter the number of samples:');
% Signal creation
F1 = 0.2;
F2 = 0.5;
F3 = 1;
Fmax = 1; % Maximum frequency
Fs = Factor*Fmax; % Sampling frequency
Ts = 1/Fs; % Sampling period
duration =1;
t = Ts:Ts:duration;
x = sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t); % Signal
%plot(t,x) % Time-domain plot
stem(t, x,'r', 'linewidth',3)
title(' Discretized signal')
xlabel('t (seconds)')
 
N = length(x); % Signal length
M = log2(N); % Determines the number of stages
 
% Approximation to the nearest multiple of 2^p if needed
if (rem(M,1) ~= 0)
    re =rem(M,1);
    M=M-re+1;
    Ne = 2^M;
    % Vector of dimension 2^p: original samples plus zero-padding
    x = [x,zeros(1,Ne-N)];
else
    Ne = N;
end

% Bit-reversal reordering
x = bitrevorder(x);
 
%% Our program:
disp('Execution time using OUR fft:')
tic

% Initialization for different stages
stage = zeros(1,Ne); % Stage n
 
for l = 1:M  % Counter from 1 to M
    if l==1 % DFT of two samples of the signal x
        for t=0:2:Ne-1
            % When t = 0, etapa(t+1:t+2) takes the values at positions 1 and 2
            stage(t+1:t+2) = stage (t+1:t+2) + my_fft (x(t+1:t+2),2^l);
        end
        coefficients = stage;
    else
        stage = zeros(1,Ne);
        for k=0:2^(l):Ne-1 % DFT of N samples
            % etapa(k+1:k+N) takes the values from N positions
            stage(k+1:k+(2^(l))) = stage(k+1:k+(2^(l))) + my_fft (coefficients(k+1:k+(2^(l))),2^l);
        end
        coefficients= stage;
    end
end
toc

% Use of dft_vectorial to compare coefficients
disp('Execution time using  dft_vectorial:')

tic
x_dft = dft_vectorial(x);
toc
 
disp('Execution time using MATLAB fft')
tic
x_fft = fft(x, Ne);
toc

Comprobation = x_dft';
Test = coefficients';
% Results
Results= [Comprobation Test];
