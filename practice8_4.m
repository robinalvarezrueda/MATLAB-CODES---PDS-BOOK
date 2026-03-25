%% PRACTICE 8.4. Manual implementation of a chirp signal and spectral validation

clc, clear all, close all
duration = 10;
fo = 1000;
f1 = 2000; 
Fmax=f1;
Fs = 10*Fmax;
Ts = 1/Fs;
tn = Ts:Ts:duration;
p=1; % p is the polynomial order (p=1: linear) (p=2: quadratic)
beta   = (f1-fo)./(duration.^(p));
fi=fo+beta*tn; % + for increasing instantaneous frequency
y = cos(2*pi*fi.*tn); % Element-wise operator (.) is required to avoid errors.
plot(tn,y);
title('CHIRP: from 1 kHz to 2 kHz in 10 seconds');
xlabel('time [s]');
ylabel('Amplitude');
grid minor;
sound(y,Fs)
