%% PRACTICE 2.6. Generation of a truncated full-wave rectified sinusoid

clc; clear all; close all 
Amax = 1; 
Fo = 500; 
T = 1/Fo; 
duration = 2*T; 
Ts = T/100;  
tn = 0:Ts:duration;  % Discrete time vector
y = Amax*sin(2*pi*Fo*tn); % Amplitude vector: 
% The full-wave rectified signal is obtained by inverting the 
% negative half-cycles using the abs command: 
y_abs = abs(y);   
y1 = y_abs; % Auxiliary vector
% Find the positions of values greater than 0.7 and, using a for loop, change them to 0.7
j = 1;
for i = tn
  if y1(j) > 0.7
     y1(j) = 0.7;
  end
  j = j + 1;
end
% Visual verification: 
stem(tn, y1) % Graphical verification
grid on 
xlabel('Time (sec)'); 
ylabel('Amplitude') 
title('Truncated Full-Wave Rectified Signal') % Plot Title 
% Audio verification: 
% Fs = 1/Ts;
% sound(y1, Fs) 
