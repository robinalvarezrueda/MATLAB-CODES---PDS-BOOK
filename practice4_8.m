%% PRACTICE 4.8. Linear growth and decay applied to a tone. 

clc; clear all; close all,      
F1 = 1000;
duration = 7;
Fmax = 2000; % for good visualization
Fs = 10*Fmax;
Ts = 1/ Fs;
tn = Ts:Ts:duration;
tn_samples = tn*Fs;
yn = sin (2*pi*F1*tn); % row vec
plot(tn,yn) 
title(' Original signal ')
%sound(yn,Fs)
% amplitudes between +1 y -1
% Ready to apply rules...
%% Construction of vector 1:
% Linear increase from 0 to 2 seconds: L1
% Linear decrease the last 2 seconds: L2
% 0 ..... L1(2sec) ............. L2(2 sec before the end) .... L_total
% CAUTION!!! 
% PUT EVERYTHING IN SAMPLES:
L_total = length (yn);
vector_amplitudes = zeros(1,L_total);
% L1 = (2 secons)*Fs:
L1 = 2*Fs;
%L2 = (duration - 2 senonds)*Fs:
L2 = (duration-2)*Fs;

% Straight Line Equation 1:
%y = x/L1=tn/L1

% Straight Line Equation 2:
%y = (-1/(L_total-L2))*(tn-L2)+1

% From 0 to L1: multiply by Straight Line 1:
for i = 1:L1
    vector_amplitudes(i) = tn_samples(i)/L1;
end
 
for i = L1+1:L2
    vector_amplitudes(i) = 1;
end
 
for i = L2+1:L_total
    vector_amplitudes(i) = (-1/(L_total-L2))*(tn_samples(i)-L2)+1;
end

figure
plot(tn,vector_amplitudes) % PERFECT //
title('Desired amplitude vector ')
xlabel('tn (seconds)')

%% NOW IT ONLY REMAINS TO APPLY THIS VECTOR TO THE TONE:
yn_modified = yn .* vector_amplitudes;
figure
plot(tn, yn_modified)
title('Desired amplitude vector x Original signal ')
xlabel('tn (seconds)')
sound(yn_modified, Fs)
