%% PRACTICE 5.2. Analysis of the problem of summing signals with different sampling frequencies

clc, close all, clear all
% Sum of two audio signals with different Fs:
[y1,Fs1]=audioread('UFO.wav'); % Fs1 = 11025 Hz      
[y2,Fs2]=audioread('Birds.wav');      % Fs2 = 44100 Hz
% EXTRACTION OF A SINGLE CHANNEL IN CASE THE AUDIO IS STEREO:
[rows1, columns1]= size(y1);
[rows2, columns2]= size(y2);
if columns1==2 
   y1_1 = y1(:,1);
end
% EXTRACTION OF A SINGLE CHANNEL IN CASE THE AUDIO IS MONO:
if columns1==1 
   y1_1 = y1;
end
if columns2==2 
   y2_1 = y2(:,1);
end
if columns2==1 
   y2_1 = y2;
end
y1_channel1=y1_1';          
y2_channel1=y2_1';         
% Create the time bases for both signals
Ts1=1/Fs1;
tn1 = Ts1:Ts1:length(y1_channel1)/Fs1;
Ts2=1/Fs2;
tn2 = Ts2:Ts2:length(y2_channel1)/Fs2;
subplot(2,1,1)
stem(tn1,y1_channel1,'b'), xlim([0.5 0.5005])
title('Audio3: Fs= 11025 samples/seg') 
subplot(2,1,2)
stem(tn2,y2_channel1,'r')
xlim([0.5 0.5005]), title('Audio4: Fs = 44100 samples/seg')
