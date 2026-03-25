function out = my_fft (inp, N)
% Computation of the N/2 twiddle factors:
fgiro = zeros(1,N/2); % Vector created to store the twiddle factors
period = N/2; % Period
for k=1:N/2
    f_twiddle(k) = exp(-1j*2*pi*(k-1)/N); % Twiddle factor for N/2 samples
end
 
% A DFT of size N depends on the two previous halves:
half1= [inp(1:N/2),inp(1:N/2)]; % First half (even samples)
half2= [inp(N/2+1:N),inp(N/2+1:N)]; % Second half (odd samples)
	
% Output computation:
out = zeros(1,N); % Create a zero vector of size N
for i=1:N/2
    out(i) = half1(i) + f_twiddle (i)* half2(i); % Compute the first DFT coefficient
    out(i+period)= half1(i) - f_twiddle (i)* half2(i);
    % The signal period is added and the sign of the twiddle factor is changed
end
end

