%% PRACTICE 4.7. Generation of multiple echoes in an audio signal.

clc, clear all, close all
 
[y,Fs]=audioread('HowAreYou.wav');
y1=y(:,1);

%  Introduction of echo:
time_delay=input('Enter delay time in seconds: ');
delay=time_delay*Fs;

% Enter the number of echoes required:
N_echos=input('Enter number of echoes: ');

% Signal amplitude
a=input('Enter amplitude reduction factor of the signal: (between 0 y 1)');

% The vector is initialized as if it were the original sound wave.
y_echo = y1';

% Loop to add echoes
for i=1:N_echos
    % Echo generated reduced in amplitude
    echo = a^i*[zeros(1,delay*i) y1']; % It should decrease with respect to the previous echo
    % Echo added to the signal
    y_echo = [y_echo  zeros(1,delay)] + echo;
end

% Echo playback 
sound(y_echo,Fs)

% Save audio file:
audiowrite('echos.wav',y,Fs);
