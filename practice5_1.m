%% PRACTICE 5.1. Summation of audio signals with the same sampling frequency.

clc, close all, clear all
% Sum of two audio signals with the same Fs:
[y1,fs1]=audioread('Wolf.wav'); %Fs1 = 44100 Hz       
[y2,fs2]=audioread('UFO.wav'); %Fs2 = 44100 Hz       
% EXTRACTION OF A SINGLE CHANNEL IN CASE THE AUDIO IS STEREO
[rows1, columns1]= size(y1);
[rows2, columns2]= size(y2);
% IF STEREO: extract a single channel
if columns1==2 
   y1_1 = y1(:,1);
end
% IF MONO: no need to extract a single channel
if columns1==1 
   y1_1 = y1;
end
% The same for the other audio:
if columns2==2 
   y2_1 = y2(:,1);
end
if columns2==1 
   y2_1 = y2;
end
y1_channel1=y1_1;          
y2_channel1=y2_1;   
subplot(2,1,1)
plot(y1_channel1)
title('Audio signal 1')
subplot(2,1,2)
plot(y2_channel1,'g')
title('Audio signal 2')
% If both Fs are equal, proceed with zero-padding
% of the shorter signal and then sum the two signals:
if fs1==fs2
    if length(y1_channel1)<length(y2_channel1)
        y1_channel1_zeros=[y1_channel1; zeros(length(y2_channel1)-length(y1_channel1),1)];
        y_sum=y1_channel1_zeros+y2_channel1;
        figure
        subplot(3,1,1)
        plot(y1_channel1_zeros)
        title('Audio signal 1')
        subplot(3,1,2)
        plot(y2_channel1,'g')
        title('Audio signal 2')
        subplot(3,1,3)
        plot(y_sum,'k'), title('Sum of two audio signals with the same Fs')
    else y2_channel1_zeros=[y2_channel1; zeros(length(y1_channel1) - length(y2_channel1),1)];
        y_sum=y1_channel1+y2_channel1_zeros;
        figure
        subplot(3,1,1)
        plot(y1_channel1), title('Audio signal 1')
        subplot(3,1,2)
        plot(y2_channel1_zeros,'g'), title('Audio signal 2 with zero-padding')
        subplot(3,1,3)
        plot(y_sum,'k'), title('Sum of two audio signals with the same Fs')
    end
end
sound(y_sum, fs1)
