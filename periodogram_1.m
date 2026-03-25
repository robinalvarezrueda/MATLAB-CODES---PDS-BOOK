function [P1,P2,P3,P4,P5,P6,P7,P8] = periodogram_1 (c1,c2,c3,c4,c5,c6,c7,c8)
    
    N=length(c1); % number of samples of the discrete signal
    FACTOR = 256;
    nFFT=2^(ceil(log2(N)))*FACTOR;

    P1=(abs(fft(c1,nFFT)));
    P2=(abs(fft(c2,nFFT)));
    P3=(abs(fft(c3,nFFT)));
    P4=(abs(fft(c4,nFFT)));
    P5=(abs(fft(c5,nFFT)));
    P6=(abs(fft(c6,nFFT)));
    P7=(abs(fft(c7,nFFT)));
    P8=(abs(fft(c8,nFFT)));
end
