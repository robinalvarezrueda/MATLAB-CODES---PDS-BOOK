%% PRACTICE 4.11. Spatial displacement of sound.

clc; clear all; close all,      
% SPATIAL VARIATION EFFECT:
% The audio CAN BE STEREO OR MONOPHONIC.
%Reading the audio file:
[yn, Fs] = audioread('Original.wav');
[rows,columns]= size(yn);
% IF IT IS STEREO, EXTRACTION OF CHANNELS:
if columns==2 
   yn1 = yn(:,1);
   yn2 = yn(:,2);
end
if columns==1 
   yn1 = yn;
   yn2 = yn;
end
Ts = 1/ Fs;
% It is passed to a row vector:
yn1 = yn1';
yn2 = yn2';

% Audio length:
L_total = length (yn1);

% Time vector (in samples):
tn_samples = 1:1:L_total;

%% Construction of vector 1:
% Linear increase from 0 to the end
vector_amplitudes_1 = zeros(1,L_total);
vector_amplitudes_2 = zeros(1,L_total);

% Equation of Line 1: positive slope
%y = x/L_total=tn_samples/L_total

% Equation of Line 2: negative slope
%y = (-tn/(L_total))+1

% Line 1:
for i = 1:L_total
    vector_amplitudes_1(i) = tn_samples(i)/L_total;
end

% Line 2:  
for i = 1:L_total
    vector_amplitudes_2(i) = (-1/(L_total))*(tn_samples(i))+1;
end
figure, hold on
plot(vector_amplitudes_1) % PERFECT //
plot(vector_amplitudes_2) % PERFECT //
title('Crossover behavior of the amplitude vector of the two channels')

%% NOW IT ONLY REMAINS TO APPLY THIS VECTOR TO THE AUDIO SIGNAL:
yn_1_modified = yn1.*vector_amplitudes_1;
yn_2_modified = yn2.*vector_amplitudes_2;
figure, hold on
plot(yn_1_modified)
plot(yn_2_modified)
title('Crossover behavior of the two channels')
Y_2_chanels = [yn_1_modified' yn_2_modified'];
sound(Y_2_chanels,Fs)

