%% PRACTICE 13.6. Reduction of Cross-Terms Using SPWVD

clc, close all, clear all

%% 1. Data acquisition (frequencies, amplitudes, and durations) of all components:
% The following data can be modified in order to introduce situations related to:
% - Frequency resolution: closely spaced tones
% - Detection: very small components relative to the largest one (amplitude = 1)

% 1.1 Component frequencies (ordered from lowest to highest):
f1=20; f2=25; f3=50; f4=53; f5=80; f6=81;
% 1.2 Amplitudes:
a1=1; a2=1; a3=1; a4=1; a5=1; a6=1;
%a1=1; a2=0.1; a3=0.1; a4=0.05; a5=0.01; a6=0.005;

% 1.3 Component durations:
t1=[0 3]; t2=[2 4]; t3=[2 3]; t4=[2.5 3.5]; t5=[2 4]; t6=[1 3];
%% 1.2. Generation of the composite signal (sum of all components):
Fs=10*f6; % Sampling frequency with respect to the highest component frequency
Ts=1/Fs;
duration = 4; % Maximum duration covered by the signal components
t=0:Ts:duration;
%% METHOD 2: Taking advantage of MATLAB programming capabilities,
% the previous method is implemented again but now in a compact way.
% First, each component is generated over the entire time interval (4 seconds):
comp1=a1*sin(2*pi*f1*t);
comp2=a2*sin(2*pi*f2*t);
comp3=a3*sin(2*pi*f3*t);
comp4=a4*sin(2*pi*f4*t);
comp5=a5*sin(2*pi*f5*t);
comp6=a6*sin(2*pi*f6*t);
% The components are filled with zeros in the intervals where they do not exist,
% taking advantage of MATLAB's logical indexing capabilities:
comp1=(t<=3).*(comp1);
comp2=((t>=2)&(t<=4)).*(comp2);
comp3=((t>2)&(t<=3)).*(comp3);
comp4=((t>=2.5)&(t<=3.5)).*(comp4);
comp5=((t>=2)&(t<=4)).*(comp5);
comp6=((t>=1)&(t<=3)).*(comp6);
% Presentation of the components in ascending order as in the ideal TF diagram:
figure
subplot(7,1,1);plot(t,comp6);title('Component 6'); xlabel('t (s)');grid on;
subplot(7,1,2);plot(t,comp5);title('Component 5'); xlabel('t (s)');grid on;
subplot(7,1,3);plot(t,comp4);title('Component 4'); xlabel('t (s)');grid on;
subplot(7,1,4);plot(t,comp3);title('Component 3'); xlabel('t (s)');grid on;
subplot(7,1,5);plot(t,comp2);title('Component 2'); xlabel('t (s)');grid on;
subplot(7,1,6);plot(t,comp1);title('Component 1'); xlabel('t (s)');grid on;
% Once the components are generated, they are summed to obtain the composite signal:
yt1 = comp1+comp2+comp3+comp4+comp5+comp6;
subplot(7,1,7);plot(t,yt1,'r');title('Composite signal'); xlabel('t (s)');grid on;
% Visualization of the ideal time–frequency diagram together with the composite signal,
% so that the presence of one or more components can be observed
% over the corresponding time intervals:
figure
subplot(2,1,1);
hold on
plot (t1,[f1 f1],'linewidth',2)
plot (t2,[f2 f2],'linewidth',2)
plot (t3,[f3 f3],'linewidth',2)
plot (t4,[f4 f4],'linewidth',2)
plot (t5,[f5 f5],'linewidth',2)
plot (t6,[f6 f6],'linewidth',2)
title('IDEAL TIME–FREQUENCY DIAGRAM')
xlabel('t (sec)')
ylabel('F (Hz)')
axis([0 6 0 100])
legend('Amp6: 1','Amp5: 1','Amp4: 1','Amp3: 1','Amp2: 1','Amp1: 1')
%legend('Amp6: 1','Amp5: 0.01','Amp4: 0.001','Amp3: 0.001','Amp2: 0.01','Amp1: 1')
subplot(2,1,2);
plot(t,yt1);
title('Composite signal in the time domain');
xlabel('t (sec)');
ylabel('Amplitude');
axis([0 6 -10 10]) % Same horizontal limits as the ideal TF diagram to observe correspondences
xn = yt1;

%% 2. FREQUENCY-DOMAIN ANALYSIS:
N=length(xn); % Number of samples of the discretized signal
FACTOR = 1024;
nFFT=2^(ceil(log2(N)))*FACTOR;
f=linspace(0,Fs,nFFT);

%% 2.1 Modified Periodogram using BH4T window:
window_2=blackmanharris(fix(length(xn)));
xn_windowed = window_2 .* xn';
PM2 = 20*log10(abs(fft(xn_windowed,nFFT)));

%% 2.2 MODIFIED CORRELOGRA
r1 = xcorr(xn); % Autocorrelation computation
r1 = r1';
% Window:
ventana1 = bartlett(2*N-1);
% Windowed autocorrelation:
rw1 = r1 .* ventana1;
% Only the positive part of the autocorrelation is retained:
rw1 = rw1(1:end);
% FFT is applied to the windowed autocorrelation:
N_r1 = length(rw1);
nFFT_corr = 2^(ceil(log2(N_r1))) * FACTOR;
Correlogram1 = abs(fft(rw1,nFFT_corr));
f_corr = linspace(0,Fs,nFFT_corr);

%% 2.3 PARAMETRIC METHOD: AR
order = 400;
[P_yulear,fb] = pyulear(xn,order,nFFT,Fs);
figure
hold on
plot(f,PM2,'b');
plot(f_corr,20*log10(Correlogram1),'r');
plot(fb,20*log10(P_yulear),'k')
legend('PM-BH4T','Correlogram Bartlett','Yule-Walker AR')
title('Comparison of spectral estimation methods')
xlabel('f (Hz)')
xlim([0 Fs/2])
grid minor

%% 3.2 TIME–FREQUENCY ANALYSIS: Wigner–Ville Distribution (WVD)

[d,f,t] = wvd(xn,Fs);
figure
subplot(2,1,1)
hold on
plot (t1,[f1 f1],'linewidth',2)
plot (t2,[f2 f2],'linewidth',2)
plot (t3,[f3 f3],'linewidth',2)
plot (t4,[f4 f4],'linewidth',2)
plot (t5,[f5 f5],'linewidth',2)
plot (t6,[f6 f6],'linewidth',2)
title('IDEAL TIME–FREQUENCY DIAGRAM')
xlabel('t (sec)')
ylabel('F (Hz)')
axis([0 6 0 100])
legend('Amp6: 1','Amp5: 1','Amp4: 1','Amp3: 1','Amp2: 1','Amp1: 1')
subplot(2,1,2)
contour(t,f,abs(d))
title('WIGNER–VILLE TIME–FREQUENCY DIAGRAM')
xlabel('t (sec)')
ylabel('F (Hz)')
axis([0 6 0 100])
colorbar
toc

tic
[d, f, t] = wvd(xn,Fs,'smoothedPseudo',hamming(501),rectwin(501), 'NumFrequencyPoints',1000);
figure
subplot(2,1,1);
hold on
plot (t1,[f1 f1],'linewidth',2)
plot (t2,[f2 f2],'linewidth',2)
plot (t3,[f3 f3],'linewidth',2)
plot (t4,[f4 f4],'linewidth',2)
plot (t5,[f5 f5],'linewidth',2)
plot (t6,[f6 f6],'linewidth',2)
title('IDEAL TIME–FREQUENCY DIAGRAM')
xlabel('t(sec)'), ylabel('F(Hz)'), axis([0 6 0 100])
legend('Amp6: 1','Amp5: 1','Amp4: 1','Amp3: 1','Amp2: 1','Amp1: 1')
%legend('Amp6: 0.005','Amp5: 0.01','Amp4: 0.05','Amp3: 0.1','Amp2: 0.1','Amp1: 1')
subplot(2,1,2);
contour(t,f,abs(d));
title('SPWVD TIME–FREQUENCY DIAGRAM')
xlabel('t(sec)'), ylabel('F(Hz)')
axis([0 6 0 100])
colorbar
toc


