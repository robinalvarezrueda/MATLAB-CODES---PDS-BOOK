%% PRACTICE 3.8. Acquisition and storage of audio signals in MATLAB.

clear all;close all;clc;

acquisition_block=1;
Fmax = 1000;
Fs=8000; %Fs > 2*Fmax
x=0;

while x==0
    % Create an audio recorder object with parameters: sampling frequency, 16 bits, 1 channel (out of 2 possible)
    y=audiorecorder(Fs,16,1);%Create the object to obtain the signal
    % Use of the object: acquires the signal in blocks of "acquisition_block" seconds
    recordblocking(y, acquisition_block); 
    % GETAUDIODATA: retrieves the stored signal:
    signal=getaudiodata(y, 'single');
    L=length(senial);% Signal length
    t=linspace(0, acquisition_block,L);%creation time vector
    plot(t,signal);grid on; grid minor;
    title(' Acquired signal with Fs = 8 kHz ')
    axis([0 1 -1 1])
    pause(acquisition_block)
end



