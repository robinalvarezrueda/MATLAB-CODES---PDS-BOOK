%% PRACTICE 6.10. Efficient vector implementation of the DFT

clc;clear all;close all;
% xn: vector containing samples from one period of the periodic signal – MUST BE A ROW VECTOR
xn=[0 1 2 3];
Xk = dft_vectorial(xn);
disp('Fourier coefficients Ck:')
Xk'
