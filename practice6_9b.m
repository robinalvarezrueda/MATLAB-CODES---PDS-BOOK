%% PRACTICE 6.9. Discrete Fourier Transform of a Sawtooth Wave

clc;clear all;close all;  
%xn: vector containing samples of one period of the signal
xn=[0 1 2 3];
Xk = dft_for(xn); % calls the dft_for function that calculates the N complex numbers
disp('Fourier coefficients Ck:'), Xk'
