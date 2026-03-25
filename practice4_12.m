%% PRACTICE 4.12. Spatial wobble effect at controlled frequency.

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
% It is passed to a row vector as the sine was:
yn1 = yn1';
yn2 = yn2';
% Audio length:
L_total = length (yn1);
% Time vector (in samples):
tn_muestras = 1:1:L_total;
tn = (1:1:L_total)/Fs;
%% Construction of vector 1:
% TRIANGULAR WAVE OF FREQUENCY fo:
fo = 0.1; % 0.5 Hz
%vector_amplitudes_1 = 0.5*(sawtooth(2*pi*fo*tn,0.5)+1);
vector_amplitudes_1 = sin(2*pi*fo*tn);
%vector_amplitudes_2 = -0.5*(sawtooth(2*pi*fo*tn,0.5)+1);
vector_amplitudes_2 = cos(2*pi*fo*tn);
figure
hold on
plot(vector_amplitudes_1) % PERFECT //
plot(vector_amplitudes_2) % PERFECT //
title ('amplitude vectors changing at 0.5 cycles/sec')
%% NOW IT ONLY REMAINS TO APPLY THIS VECTOR TO THE TONE:
yn_1_modified = yn1.*vector_amplitudes_1;
yn_2_modified = yn2.*vector_amplitudes_2;
figure
hold on
plot(yn_1_modified)
plot(yn_2_modified)
title ('Increase and decrease of amplitude amplitude at 0.5 cycles/sec')
Y_2_chanels = [yn_1_modified' yn_2_modified'];
sound(Y_2_chanels,Fs)
