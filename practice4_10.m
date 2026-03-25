%% PRACTICE 4.10. NONLINEAR growth and decrease applied to a tone.

clc; clear all; close all,      
F1 = 1000;
duration = 7;
Fmax = 2000; % for good visualization
Fs = 10*Fmax;
Ts = 1/ Fs;
tn = Ts:Ts:duration;
tn_muestras = tn*Fs;
yn = sin (2*pi*F1*tn); %vector fila
plot(yn) 
title('Original signal')
xlabel('tn (seconds)')
%sound(yn,Fs)
% amplitudes between +1 y -1
% Ready to apply rules...

%% Construction of vector 1:
% Linear increase from 0 to 2 seconds: L1
% Linear decrease the last 2 seconds: L2
% 0 ..... L1(2seg)..............L2(2 seg before the end)..... L_total
% CAREFUL!!!
% PUT EVERYTHING IN SAMPLES:
L_total = length (yn);
vector_amplitudes = zeros(1,L_total);
% LONGITUD 1:
% L1 = (2 seconds)*Fs:
L1 = 2*Fs;
% LONGITUD 2: %L2 = (duration - 2 seconds)*Fs:
L2 = (duration-2)*Fs;
%Equation for INCREASE:% Logistic function 1: beta = 1
beta = 4;
y1=2./(1+exp(-beta*tn))-1;
%Equation for DECREASE:
y1_inverted = fliplr(y1);
% From 0 to L1: multiply by Line 1:
for i = 1:L1
    vector_amplitudes(i) = y1(i);
end
for i = L1+1:L2
    vector_amplitudes(i) = 1;
end
for i = L2+1:L_total
    vector_amplitudes(i) = y1_inverted(i);
end
figure
plot(tn,vector_amplitudes) % PERFECT //
title('Conformation of the amplitude vector')
xlabel('tn (seconds)')

%% NOW IT ONLY REMAINS TO APPLY THIS VECTOR TO THE TONE:
yn_modified = yn.*vector_amplitudes;
figure
plot(tn,yn_modified)
title('Amplitude vector applied to the audio signal'), xlabel('tn (seconds)')
sound(yn_modified,Fs)
