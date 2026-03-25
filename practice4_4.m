%% PRACTICE 4.4. Temporal inversion of an audio signal (reverse)

clc; clear all; close all,      
[y,Fs] = audioread('level.wav');
y1 = y(:,1);                   
y1_inverted = y1(end:-1:1);
hold on
plot(y1,'k')
plot(y1_inverted,'b')
legend ('original', 'inverted')
sound(y1,Fs);    % The original y1 is heard. 
pause;               % Enter in thel Command Windows to continue
sound(y1_inverted, Fs); % y1 is heard in reverse
