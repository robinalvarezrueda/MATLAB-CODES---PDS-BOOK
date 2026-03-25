%% PRACTICE 3.7. Recovery of composite signals with multiple frequencies

clc, close all, clear all
% Signal data:
F1=10; % frequency of the first component
F2=20; % frequency of the second component
Fmax=F2; % maximum frequency
Fs=2.1*Fmax; %Fs = FACTOR * Fmax
Ts=1/Fs; % Sampling period:
% Signal duration: 20 samples 
duration = 20*Ts;
% Discrete-time vector:
tn=0:Ts:duration; 
% "Analog" waveform simulation:
% Analog sampling time much smaller than Ts 
Ta=Ts/10; 
% Analog time vector:
ta=0:Ta:duration; 
% Analog signal simulation:
ya=sin(2*pi*F1*ta) + sin(2*pi*F2*ta);   
% Sampled signal simulation:
yn= sin(2*pi*F1*tn) + sin(2*pi*F2*tn);   

%Plot of analog and sampled signals:
subplot(5,1,1)
plot(ta,ya,'g',tn,yn,'o');
%axis([0 duration -1 1]);
grid on
title('ANALOG AND SAMPLED SINUSOIDAL WAVE, Fs = FACTOR * Fmax')
 
% SHIFTED SINCS TOWARD THE SAMPLE INSTANTS:
for n=0:duration/Ts % 20 samples
    shifted_sincs(n+1,:)=sinc((ta-n*Ts)/Ts);
    subplot(5,1,2)
    plot(ta, shifted_sincs(1:n+1,:));
    pause(0.1)
    title('SINCS SHIFTED TOWARD EACH SAMPLE');
end
 
% (SHIFTED SINCS) * (CORRESPONDING SAMPLES):
for n=0:duration/Ts
    shifted_sincs_times_samples(n+1,:)= yn(n+1)*sinc((ta-n*Ts)/Ts);
    subplot(5,1,3)
    plot(ta, shifted_sincs_times_samples(1:n+1,:),tn(1:n+1),yn(1:n+1),'o');
    pause(0.1)
    title('EACH SAMPLE MULTIPLIED BY ITS CORRESPONDING SINC')
end
 
% RECONSTRUCTED SIGNAL: 
%reconstructed_signal = sum(shifted_sincs_times_samples;
for n=0:duration/Ts
    subplot(5,1,4)
    reconstructed_signal = sum(shifted_sincs_times_samples (1:n+1,:));
    plot(ta, reconstructed_signal,'k')
    title('RECOVERED WAVE BY ADDING CONTRIBUTIONS')
    pause(0.1)
end
    
% COMPARISON BETWEEN ORIGINAL AND RECOVERED SIGNAL:
subplot(5,1,5)
hold on
plot(ta,ya,'k');
plot(ta, reconstructed_signal,'b');
legend('Original Wave', 'Recovered Wave');
title('Signal Recovery with Fs = FACTOR * Fmax');
 
