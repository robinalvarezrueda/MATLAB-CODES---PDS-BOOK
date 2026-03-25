%% PRACTICE 2.8. Generation of a sinusoidal–triangular hybrid wave

clc, close all, clear all
Fo = 1000;
T = 1/Fo;
duration = 3*T;
Ts = T/100; % Time between samples
tn = 0:Ts:duration; % Start:Step:End

y1 = 1*sin(2*pi*Fo*tn);
y2 = 0.5*sawtooth(2*pi*Fo*tn, 0.5) + 0.5;

subplot(3,1,1)
plot(tn, y1, 'b')
hold on
plot(tn, y2, 'r')
title('Original Sine Wave and Positive-Only Triangular Wave')
grid minor

% To align the triangular wave as desired, we must 
% double the frequency:
y2_2f = 0.5*sawtooth(2*pi*2*Fo*tn, 0.5) + 0.5;

subplot(3,1,2)
plot(tn, y1, 'b')
hold on
plot(tn, y2_2f, 'r')
title('Original Sine and Positive-Only Triangular Wave with 2Fo')
grid minor

% Now, if the sine wave is negative, replace it 
% with the triangular wave:
y_final = y1;
for n = 1:length(tn)
    if y1(n) <= 0
        y_final(n) = y2_2f(n);
    end
end

y_final = 0.5 * y_final;

subplot(3,1,3)
plot(tn, y_final, 'r')
title('Mixed Requested Waveform at Fo = 1 KHz')
xlabel('t (sec)')
grid minor

% Audio verification: 
% Fs = 1/Ts;
% sound(y_final, Fs)
