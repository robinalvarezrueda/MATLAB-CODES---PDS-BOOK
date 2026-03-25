%% PRACTICE 6.18. Effect of the period on the amplitude spectrum

% PERIOD VARIATION OF PULSE T=2, 10, 20, and 500
clc, clear all, close all
% ----- PULSE TRAIN GENERATION ------------
% PULSE VARIABLES
pulse_period = 2;                         % Pulse period (T)
time_vector = -pulse_period:0.01:pulse_period; % Pulse time vector
single_pulse = [];                        % Storage vector for a single pulse
total_pulse_train = [];                   % Storage vector for the pulse train
len_time = length(time_vector);           % Length of the time vector
% PULSE TRAIN GENERATION 
for k=1:100                               % Length of the pulse train
    % Creation of a single pulse 
    for j=1:len_time
        if time_vector(j) < -1
            single_pulse(j) = 0;
        end
        if time_vector(j) >= -1 && time_vector(j) <= 1
            single_pulse(j) = 1;
        end
        if time_vector(j) > 1
            single_pulse(j) = 0;
        end 
    end
    total_pulse_train = [total_pulse_train single_pulse]; % Store generated pulses 
end
% -------- AMPLITUDE SPECTRUM --------------
% VARIABLES FOR AMPLITUDE SPECTRUM
working_freq = 100;                        % Operating frequency 
fs = 2 * working_freq * pulse_period;      % Sampling frequency
ts = 1 / fs;                               % Sampling period
duration = 1;                              % Duration of each component (Cn)
tn = -duration:ts:duration;                % Cn duration vector
p = 1;                                     % Pulse width value p=1
% GENERATION OF COMPLEX FOURIER SERIES COEFFICIENTS
% Expression for generating Cn using the sinc function
cn = ((p/ts) * sinc(tn * 2 * pi * working_freq * p / 2)) / fs;  
cn = abs(cn);
figure
% PLOTTING THE DISCRETE SIGNAL
subplot(2,1,1) 
plot(total_pulse_train, 'LineWidth', 1.5)  % Plotting the pulse train signal
axis([0 15000 -0.5 1.5]), xlabel('Time (sec)'), ylabel('Amplitude')
title('Rectangular Pulse')                    
legend(['Period T = ', num2str(pulse_period)]), grid minor 
% PLOTTING THE AMPLITUDE SPECTRUM
subplot(2,1,2)
stem(tn, cn, 'g', 'LineWidth', 1.5)        % Plotting the magnitude spectrum
axis([-0.02 0.02 -0.5 1.5]), xlabel('Frequency (Hz)'), ylabel('Amplitude')
title('Amplitude Spectrum'), legend(['Period T = ', num2str(pulse_period)]), grid minor
