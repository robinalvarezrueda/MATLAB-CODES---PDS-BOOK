%% PRACTICE 4.3. Attenuation and amplification of audio signals.

clc; clear all; close all,      
[y,Fs] = audioread('hello.wav');
y1 = y(:,1);                   
atenuated = 0.5*y1;  % atenuation: 50%
amplified = 2*y1;  % amplification: 200%
hold on
plot(y1,'k')
plot(atenuated,'b')
plot(amplified, 'r')
legend ('original', 'atenuated', 'amplified')
sound(y1,Fs);                  % Y1 mono channel is heard.
pause;                             % Press Enter in the Command Window to continue.
sound(atenuated,Fs);       % You can hear the attenuated signal
pause;                             % Press Enter in the Command Window to continue.
sound(amplified,Fs);    % The amplified signal is heard.

