%% PRACTICE 2.11. Time–frequency analysis of sequential signals

% Sequential Generator:
clc; clear; close all;
w = 1;
while w <= 4 % Loop runs 4 times
    %% Wave 1: Sinusoid (1 KHz), Duration = 0.5s
    duration1 = 0.5;
    Fo1 = 1000;  T1 = 1/Fo1;
    Ts1 = T1/100; % Sampling period
    tn1 = 0:Ts1:duration1;
    y1 = sin(2*pi*Fo1*tn1);
    Fs1 = 1/Ts1; % Sampling frequency
    sound(y1, Fs1); pause(duration1);
    %% Wave 2: Sinusoid (2 KHz), Duration = 0.7s
    duration2 = 0.7;
    Fo2 = 2000; T2 = 1/Fo2;  
    Ts2 = T2/100;  
    tn2 = 0:Ts2:duration2;
    y2 = sin(2*pi*Fo2*tn2);
    Fs2 = 1/Ts2; 
    sound(y2, Fs2); pause(duration2);
    %% Wave 3: Sinusoid (3 KHz), Duration = 0.5s
    duration3 = 0.5;
    Fo3 = 3000; T3 = 1/Fo3;  
    Ts3 = T3/65;  
    tn3 = 0:Ts3:duration3;
    y3 = sin(2*pi*Fo3*tn3);
    Fs3 = 1/Ts3; 
    sound(y3, Fs3); pause(duration3);
    w = w + 1; % Increment loop counter
end
