%% PRACTICE 4.13. Application of the Flanging effect using variable delay.

clc,clear all,close all;
% Flanging: Delay (0 ms - 15 ms),	Sinusoidal (0,1 Hz - 1 Hz)
% Vibrato:	Delay (5 ms - 10 ms),	Sinusoidal (5 Hz- 14 Hz)
% Chorus:	Delay (10 ms - 25 ms), Random
%% Reading the original audio:
[x,Fs] = audioread('acoustic.wav'); %leemos la forma de onda de la muestra

% Flanging: 
% 1.- Delay (0 ms - 15 ms):	Let's take Delay = 3 (ms):
delay_maximum_time=0.003; %0.01; %0.003; % 3 (ms) maximum delay time
% We convert the delay in time[ms] to maximum delay in simples
% Conversion factor: Fs (samples / sec):
delay_maximum_samples=round(delay_maximum_time*Fs); 

% 2.- Sinusoidal de Fo (0,1 Hz - 1 Hz): Let's take sinusoid of 1 (Hz)
Fo = 10; %Translation: % flanger frequency in Hz
% Discrete time base in samples:
n=1:length(x);
%Discrete time base in seconds: conversion factor the Fs: n/Fs
delay_variable_sinusoidal = (sin(2*pi*n/Fs))';  

% Sum of the original signal plus the original with variable delay:
% y(n)=x(n)+ x(n+d(n)); 
y = zeros(length(x),1); % We create an empty vector
% The first samples:
y(1:delay_maximum_samples)=x(1:delay_maximum_samples);  

% The following samples: we add delay to each sample
for i = (delay_maximum_samples+1):length(x)
    senial_delayed=ceil((delay_variable_sinusoidal(i))*delay_maximum_samples);  
% We generate delay from (1-max_samp_delay) and ensure an integer  
    y(i) = x(i) + x(i-senial_delayed);   % We add delayed sample
end
%% Verificación auditiva de la creación de la señal que contiene el efecto Flanger
%sound(x,Fs) % playback of the original audio
sound(y,Fs); % playback of the audio with the Flanger effect
%% Graphics
figure;
subplot(2,1,1);
plot(x,'r');
title(' Original signal');
ylabel('Amplitud'); 
xlabel('Samples');
subplot(2,1,2);
plot(y,'b'); ylabel('Amplitud');  xlabel('Samples');
title('Audio signal with the effect  Flanger');
