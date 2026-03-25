%% PRACTICE 2.7. Generation of a half-wave rectified sinusoid

clc; clear all; close all 
Amax = 0.5;
Fo = 1000; 
T = 1/Fo; 
duration = 2*T; 
% Time between samples (considering 100 samples per period) 
Ts = T/100;  
tn = 0:Ts:duration;  % start:step:end   
% Amplitude vector: 
y1 = Amax*sin(2*pi*Fo*tn); 
% A half-wave rectifier can be obtained by replacing 
% the negative part of a sinusoidal signal with zeros:
y2 = y1;
j = 1;
for i = tn
  if y1(j) < 0
     y2(j) = 0;
  end
  j = j + 1;
end
stem(tn, y2);
xlabel('Time (sec)') % X-axis Title
ylabel('Amplitude') % Y-axis Title
title('Half-Wave Rectified Signal') % Plot Title
% Audio verification: 
% Fs = 1/Ts;
% sound(y2, Fs)
