%% PRACTICE 11.3. Spectral Estimation Using the Multitaper Method

clc, close all , clear all;
% Generation of signal with 10 components:
duracion = 0.5;
Fmax=250;
Fs=10*Fmax;
t=0:1/Fs: duracion; % Duration 10 sec
xn=1*sin(2*pi*100*t)+1*sin(2*pi*108*t)+...
  0.5*sin(2*pi*120*t)+0.5*sin(2*pi*127*t)+...
  0.1*sin(2*pi*140*t)+0.1*sin(2*pi*146*t)+...
  0.05*sin(2*pi*160*t)+0.05*sin(2*pi*165*t)+...
  0.01*sin(2*pi*180*t)+0.01*sin(2*pi*184*t)+...
  0.005*sin(2*pi*200*t)+0.005*sin(2*pi*203*t)+...
  0.001*sin(2*pi*220*t)+0.001*sin(2*pi*222*t)+...
  0.0005*sin(2*pi*240*t)+0.0005*sin(2*pi*241*t);

% SNR = 25; %10dB
% xn = awgn (xn, SNR, 'measured');

%% FREQUENCY DOMAIN
%% SIMPLE PERIODOGRAM
N = length(xn);
FACTOR = 128;
nFFT = 2^ceil(log2(N)) * FACTOR;
% Simple periodogram (implicitly rectangular windowed)
Periodogram = 20*log10(abs(fft(xn, nFFT)));
% Frequency axis
f = linspace(0, Fs, nFFT);
%% MODIFIED PERIODOGRAM (Blackman-Harris 4-Term)
% 1. Window generation
window_BH4T = blackmanharris(length(xn));
% 2. Windowing in the time domain
xn_windowed = xn .* window_BH4T';
% 3. Modified periodogram
Modified_Periodogram = 20*log10(abs(fft(xn_windowed, nFFT)));
% Frequency axis
f_periodogram = linspace(0, Fs, nFFT);
%% Plot comparison
figure
hold on
plot(f_periodogram, Periodogram, 'b');
plot(f_periodogram, Modified_Periodogram, 'r'); xlabel('Frequency (Hz)');
legend('Simple Periodogram (Rectangular)', ...
       'Modified Periodogram (Blackman-Harris 4-Term)');
title('Simple Periodogram vs. Blackman-Harris 4-Term Periodogram');
xlim([0 Fs/2]); grid minor


%% METODO MULTITAPER - SLEPIAN:
nw = 2;
[p_mtp_slepian_nw2,f_mtp] = pmtm(xn,nw,nFFT,Fs);
nw = 4;
[p_mtp_slepian_nw4,f_mtp] = pmtm(xn,nw,nFFT,Fs);
% GRAFICAS:
figure, hold on
plot(f_mtp,20*log10(p_mtp_slepian_nw2),'b');
plot(f_mtp,20*log10(p_mtp_slepian_nw4), 'k')
legend('P. Slepian nw=2','P. Slepian nw=4')
title('Multitaper-Slepian nw=2 VERSUS Multitaper-Slepian nw=4')
xlabel ('f(Hz)')
xlim([0 Fs/2]);% Xmin Xmax Ymin Ymax
grid minor
%% METODO MULTITAPER - SINE:
nw = 2;
[p_mtp_sine_nw2,f_mtp] = pmtm(xn,nw,nFFT,Fs,'Tapers','sine');
nw = 4;
[p_mtp_sine_nw4,f_mtp] = pmtm(xn,nw,nFFT,Fs,'Tapers','sine');
figure, hold on
plot(f_mtp,20*log10(p_mtp_sine_nw2),'b');
plot(f_mtp,20*log10(p_mtp_sine_nw4), 'k')
legend('P. Sine nw=2','P. Sine nw=4')
title('Multitaper-Sine nw=2 VERSUS Multitaper-Sine nw=4')
xlabel ('f(Hz)')
xlim([0 Fs/2]);% Xmin Xmax Ymin Ymax
grid minor
