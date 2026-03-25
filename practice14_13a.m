%% PRACTICE 14.13a. Automatic Vowel Recognition Using an MLP

clc, close all, clear all
%% Recording of the 50 vowels:
for i=1:1:50
%% Enter audio file name
%% Example: a1,a2,….a10,….e10,….u10
name=input('File name: ','s'); 
fs=44100; %% Sampling frequency
audio=audiorecorder(fs,16,1); % Creation of voice recording object
disp ('You have 2 seconds to pronounce a vowel');
recordblocking(audio,2); % Recording lasts 2 seconds
disp('End of Recording');
y=getaudiodata(audio);
% Save audio in folder Vowels_testDatabase
audiowrite(strcat([pwd '\Vowels_test\', name,'.wav']),y,fs);
end
