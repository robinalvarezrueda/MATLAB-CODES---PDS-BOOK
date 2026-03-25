%% PRACTICE 8.11 - Part 1. Differentiation among vowels pronounced by a person 

clc; close all; clear all;

%% Code section to record the 50 vowels
for i = 1:1:50
    %% Enter the audio file name
    %% Example: a1, a2, .... a10, .... e10, .... u10
    filename = input('File name: ','s'); 
    fs = 44100; %% Sampling frequency
    audioObj = audiorecorder(fs,16,1); % Create object to record voice
    disp('You have 2 seconds to pronounce a vowel...');
    recordblocking(audioObj,2); % Recording lasts 2 seconds
    disp('End of recording');
    y = getaudiodata(audioObj);
    % Save audio in the folder "VowelDatabase"
    % pwd: identifies the current directory
    audiowrite(strcat([pwd '\VowelDatabase\', filename,'.wav']), y, fs);
end
