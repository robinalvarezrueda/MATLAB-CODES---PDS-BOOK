%% PRACTICE 4.9. Linear growth and decrease applied to an audio

clc; clear all; close all,      

% Reading the audio file:
[yn, Fs] = audioread('Original.wav');
Ts = 1/ Fs;

% A channel is extracted:
yn = yn(:,1);

% It is passed to a row vector as the sine was:
yn = yn';

% The duration in seconds is extracted:
duration = length (yn)/Fs;

% The discrete time base is formed:
tn = Ts:Ts:duration;
tn_samples = tn*Fs;
plot(tn, yn) 
title('Original signal')
xlabel('tn (seconds)')

%sound(yn,Fs)
% amplitudes between +1 and -1
% Ready to apply rules...
%% Construction of vector 1:
% Linear increase from 0 to 2 seconds: L1
% Linear decrease the last 2 seconds: L2
% 0 ..... L1(2seg)..............L2(2 seg before the end)..... L_total
% CAREFUL!!!
% PUT EVERYTHING IN SAMPLES:
L_total = length (yn);
vector_amplitudes = zeros(1,L_total);
% L1 = (2 seconds)*Fs:
L1 = 2*Fs;

%L2 = (duration - 2 seconds)*Fs:
L2 = (duration-2)*Fs;

% Equation of a Line 1:
%y = x/L1=tn/L1

% Equation of a Line 2:
%y = (-1/(L_total-L2))*(tn-L2)+1

% From 0 to L1: multiply by Line 1:
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
title('Desired amplitude vector')
xlabel('tn (seconds)')

%% NOW IT ONLY REMAINS TO APPLY THIS VECTOR TO THE TONE:
yn_modified = yn.*vector_amplitudes;
figure
plot(tn,yn_modified)
title(' Desired amplitude vector x Original signal ')
xlabel('tn (seconds)')
sound(yn_modified,Fs)
