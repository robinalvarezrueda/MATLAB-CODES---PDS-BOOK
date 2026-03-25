%% PRACTICE 4.14. Application of the Tremolo effect in audio signals

clc,close all,clear all
%% Extraction of the information contained in the original audio file
[original,Fs]=audioread('acoustic.wav'); 
original_ch1=original(:,1); 
% Discrete time base in samples:
n=1:length(original_ch1);
t_samples = n/Fs; % Time vector [s] using the conversion factor Fs
s_control = 0.5*sin(20*pi*t_samples) + 1; % signal that allows varying the volume of x(n) with a certain pattern and speed
s_tremolo = original_ch1 .* s_control'; % Implementation of the Tremolo effect
figure
subplot(3,1,1)
plot (original_ch1,'c')
title('Original audio signal (left channel)')
subplot(3,1,2)
plot (s_control,'k')
title('Control signal (volume and speed)')
subplot(3,1,3)
plot (s_tremolo,'b')
title('Audio signal with the Tremolo effect'), xlabel('Time [samples] - 48k [samples/s]')
sound(s_tremolo,Fs) % playback of the audio with the Tremolo effect
