%% PRACTICE 2.10. Implementation of a sequential signal generator

% Sequential Generator:
clc; clear; close all;
run_loop = 1;
while run_loop == 1 % Infinite generation loop
    % Wave 1: Half-wave rectified sine (1 KHz), duration = 3 sec:
    duration1 = 3; 
    Fo1 = 1000; 
    T1 = 1/Fo1;
    Ts1 = T1/100; 
    tn1 = 0:Ts1:duration1; 
    y1 = sin(2*pi*Fo1*tn1);
    % Half-wave rectification logic:
    y1_rect = y1;
    j = 1;
    for i = tn1
        if y1(j) < 0
            y1_rect(j) = 0;
        end
        j = j + 1;
    end
    Fs1 = 1/Ts1;  
    sound(y1_rect, Fs1);  pause(duration1);
    %% Wave 2: Square wave (2 KHz), duration = 2 sec:
    duration2 = 2; 
    Fo2 = 2000;
    T2 = 1/Fo2;  
    Ts2 = T2/100;  
    tn2 = 0:Ts2:duration2; 
    y2 = square(2*pi*Fo2*tn2, 50);
    Fs2 = 1/Ts2; 
    sound(y2, Fs2); pause(duration2);
    %% Wave 3: Sawtooth wave (1.5 KHz), duration = 4 sec:
    duration3 = 4; 
    Fo3 = 1500;
    T3 = 1/Fo3;  
    Ts3 = T3/100;  
    tn3 = 0:Ts3:duration3; 
    y3 = sawtooth(2*pi*2*Fo3*tn3, 1);
    Fs3 = 1/Ts3; 
    fprintf('Playing: Sawtooth wave (1.5 KHz)\n');
    sound(y3, Fs3); pause(duration3);
end
