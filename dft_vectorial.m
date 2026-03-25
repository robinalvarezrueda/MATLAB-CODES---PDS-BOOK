function [Xk] = dft_vectorial (xn)   
% N: is the length of the samples of one period of the periodic signal
N=length(xn);
WN= exp(-j*2*pi/N); % complex exponential notation.

n= [0:1:N-1];       % row vector for n
k= [0:1:N-1];       % row vector for k
nk= n'*k;           % creation of an NxN array of nk values 
WNnk = WN .^nk;      % DFS matrix
Xk = xn * WNnk;     % Row vector with DFS coefficients: xn must be a ROW vector
