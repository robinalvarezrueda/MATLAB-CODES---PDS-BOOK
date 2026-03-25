%% PRACTICE 4.5. Vertical inversion of an audio signal.

clc,close all,clear all
[y,Fs]=audioread('level.wav');
y1=y(:,1);
y_inverted_vertical=(-1)*y1;
plot(y1,'b')
hold on
plot(y_inverted_vertical,'r')
legend('Vertical inverted signal')
sound(y_inverted_vertical,Fs)
