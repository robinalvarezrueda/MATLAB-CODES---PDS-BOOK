%% PRACTICE 9.8 b. CALCULATION OF THE TWO PARAMETERS USING OWN CODE

clc; clear all; close all;
L = 25; % Window length
xn = rectwin(L);
%% FREQUENCY DOMAIN:
N = length(xn);
nFFT = 2^ceil(log2(N)) * 128; % nFFT computation (time samples)
% SIMPLE PERIODOGRAM
Xn = fft(xn, nFFT);
P = 20*log10(abs(Xn));
% Creation of the normalized frequency axis (same as wvtool):
f = 1:1:nFFT;
f_norm = f/(nFFT/2);
%% Measurement of amplitude difference (main peak - secondary peak)
% The findpeaks function does not recognize the main peak,
% so the max instruction is used
[pks, locs] = findpeaks(P, f_norm);  
Delta = pks(1) - max(P); % interested in absolute value
%% Measurement of main lobe width at -3 dB:
P_max = max(P);
P_3dB = fix(max(P)) - 3;  % maximum - 3 dB
index_P_3dB = find(fix(P) == P_3dB);
f_norm_3dB = f_norm(index_P_3dB);
MainLobeWidth_3dB = 2 * f_norm_3dB(1);
subplot(1,2,1); 
plot(xn,'x');  
title('Window in the Time Domain');  
xlabel('Samples');  
ylabel('Amplitude');  
axis([0 25 0 max(xn)+0.2]);  
subplot(1,2,2);  
plot(f_norm, P);  
text(MainLobeWidth_3dB+0.1, pks(1)+10, ...
    ['Main lobe width (-3 dB): ' num2str(MainLobeWidth_3dB)]);  
text(MainLobeWidth_3dB+0.1, pks(1)+4, ...
    ['Delta (main-secondary): ' num2str(Delta)]);  
title('Frequency Domain');  
ylabel('Magnitude (dB)');  
xlabel('Normalized Frequency');  
axis([0 1 min(P)-5 max(P)+5]);
