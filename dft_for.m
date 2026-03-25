function [Xk] = dft_for(xn)  
% N: Sample length of a single period of the periodic signal.
% x(n): Discrete-time samples of the periodic signal over period N.
N=length(xn);

% DFT Computation: 

for k=1:N
    sum=0; % Accumulator variable for each DFT coefficient X(k).
    % Nested loop to compute each individual frequency-domain coefficient X(k).

    for n=0:(N-1)
        sum=sum+xn(n+1)*exp(-j*2*pi*k*n/N);
    end
    % Vector containing the computed DFT coefficients (Ck):
    Xk(k)=sum;
end
