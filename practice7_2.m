%% PRÁCTICA 7.2. Progressive implementation of an FFT based on symmetry patterns

clc , clear all, close all
% Creation of the signal to be analyzed:
Factor = 8; % Number of complex samples: 8
F1 = 0.2;
F2 = 0.5;
F3 = 1;
Fmax = 1; % Maximum frequency
Fs = Factor*Fmax; % Sampling frequency
Ts = 1/Fs; % Sampling period
duration =1;
t = Ts:Ts:duration;
x = sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t); % Signal
stem(t, x,'r', 'linewidth',3)
title(' Discretized signal with 8 samples')
xlabel('t (seconds)')
 
% Bit-reversal reordering
x = bitrevorder(x);
 
N = length(x); % Signal length
M = log2(N);   % Power of two: N = 8 ; M = 3
Ne = N;
 
% Initialization for different stages
stage1 = zeros(1,Ne); % Stage 1
stage2 = zeros(1,Ne); % Stage 2
stage3 = zeros(1,Ne); % Stage 3
 
for l = 1:M  % Counter from 1 to M stages
    if l==1 % DFT of two samples of the signal x
        for t=0:2:Ne-1
            % When t = 0, etapa1(t+1:t+2) takes the values at positions 1 and 2
            stage1(t+1:t+2) = stage1(t+1:t+2) + my_fft (x(t+1:t+2),2^l);
        end
        coefficients = stage1;
    end
    if l==2
        for k=0:4:Ne-1 % DFT of 4 samples
            % stage2(k+1:k+4) takes the values from four positions
            stage2(k+1:k+4) = stage2(k+1:k+4) + my_fft (stage1(k+1:k+4),2^l);
        end
        coefficients= stage2;
    end
    if l==3 % DFT of 8 samples
        for k=0:8:Ne-1
            stage3(k+1:k+8) = stage3(k+1:k+8) + my_fft (stage2(k+1:k+8),2^l);
        end
        coefficients= stage3;
   end
end
 
% Use of the dft_vectorial function to compare coefficients
x_dft = dft_vectorial (x);
 
Comprobation = x_dft';
Test = coefficients';
% Results
Results= [Comprobation Test]
