%% PRACTICE 13.13. Global Comparison of Time–Frequency Methods


clc, close all, clear all
 
%% 1. Data acquisition (frequencies, amplitudes, and durations) of all components:
% The following data should only be replaced depending on whether one wants
% to introduce problems related to:
% - Frequency resolution: very closely spaced tones
% - Detection: very small components relative to the largest one.
clc, close all, clear all
Fmin1=0; Fmax1=400;
Fmin2=200; Fmax2=600;
Fmin3=300; Fmax3=700;
Fmin4=350; Fmax4=750;
Fmin5=375; Fmax5=775;
Fmin6=385; Fmax6=785;
Duracion=1;
Fs=10*Fmax6;
Ts=1/Fs;
t=Ts:Ts:Duracion;
y1=1*chirp(t,Fmin1,Duracion,Fmax1);
y2=0.5*chirp(t,Fmin2,Duracion,Fmax2);
y3=0.1*chirp(t,Fmin3,Duracion,Fmax3);
y4=0.05*chirp(t,Fmin4,Duracion,Fmax4);
y5=0.025*chirp(t,Fmin5,Duracion,Fmax5);
y6=0.001*chirp(t,Fmin6,Duracion,Fmax6);

xn = y1+y2+y3+y4+y5+y6;

% ==================================================
%% 3.1 TIME–FREQUENCY ANALYSIS: SPECTROGRAM
% A large BH4T window is used (20% -- signal / 15):
% window_RF = rectwin(fix(length(xn)/15));
% noverlap_RF = fix(length(window_RF)/2);
% L_window_RF = length(window_RF);
% FACTOR = 32;
% nFFT_window_RF = 2^(ceil(log2(L_window_RF))) * FACTOR;

% Use of the spectrogram function WITHOUT output parameters:
% figure
% tic
% spectrogram(xn, window_RF, noverlap_RF, nFFT_window_RF, Fs, 'yaxis');
% title('SPECTROGRAM WITHOUT OUTPUT PARAMETERS');
% toc % 2.34 s; 4 s on screen

%% 3.2 TIME–FREQUENCY ANALYSIS: Wigner–Ville Transform (WVD)
% tic
% [d, f, t] = wvd(xn, Fs);
% figure
% contour(t, f, abs(d));
% title('WIGNER–VILLE TIME–FREQUENCY DIAGRAM')
% xlabel('t (s)')
% ylabel('F (Hz)')
% colorbar
% toc % 40 s; 85 s on screen

% ==================================================
%% 3.3 TIME–FREQUENCY ANALYSIS: Smoothed Pseudo Wigner–Ville Transform (SPWVD)
% tic
% [d, f, t] = wvd(xn, Fs, 'smoothedPseudo', hamming(501), rectwin(501), ...
%                'NumFrequencyPoints', 1024);
% figure
% contour(t, f, abs(d));
% title('SPWVD TIME–FREQUENCY DIAGRAM')
% xlabel('t (s)')
% ylabel('F (Hz)')
% colorbar
% toc % 24 s; 20 s on screen

% ==================================================
%% 3.4 GABOR TRANSFORM
% In order to function correctly, the following procedure must be respected:
% inputSignal = xn'; % input signal
% tic
% F = DGTtool('windowName','Gauss'); % NO PARAMETER EFFECT; same result obtained
% %F = DGTtool('windowShift',500,'windowLength',1500,'FFTnum',2000,'windowName','Blackman')
% %F = DGTtool('windowShift',noverlap_RF,'windowLength',length(window_RF), ...
% %            'FFTnum',nFFT_window_RF,'windowName','Blackman')

% =============================================================
% X = F(inputSignal);
% % Spectrogram plot. Sampling frequency can be omitted: F.plot(x).
% % Note: plotting functions can be used immediately after defining F.
% x = F.pinv(X); % converts the spectrogram back into a signal
% % If the previous instruction is not executed, the following will not work:
% % F.plot(S,Fs); % WOULD NOT WORK
% F.plot(x, Fs); % WARNING: x must be used here instead of X (counterintuitive).
% %F.plotReassign(x,Fs)
% sgtitle('Gabor Transform with Gaussian Window');
% toc % 1.62 s; 2 s on screen

% =============================================================
%% 3.5 FOURIER REASSIGNED SPECTROGRAM
% tic
% figure
%
% % Use of the function WITH output parameters:
% [P, F, T] = pspectrum(xn, Fs, 'FrequencyLimits', [0 1000], ...
%                       'FrequencyResolution', 40, 'Leakage', 0.85, ...
%                       'spectrogram', 'Reassign', true);
% mesh(T, F, P) % produced very good results
% colormap parula
% title('FREQUENCY-REASSIGNED SPECTROGRAM')
% xlabel('Time')
% ylabel('F (Hz)')
% view(2)
% toc % 0.52 s; 1 s on screen

% =========================================
%% 3.6 TIME–FREQUENCY ANALYSIS
% Fourier-based SynchroSqueezing Transform (FSST)
% window length = total signal length / 10
% tic
% window_F = rectwin(fix(length(xn)/10));
% [d_F, f_F, t_F] = fsst(xn, Fs, window_F);
% figure
% contour(t_F, f_F, abs(d_F));
% title('FSST with window length = 10% of the signal length')
% xlabel('t (s)')
% ylabel('F (Hz)')
% toc % 1.5 s; 3 s on screen

% ===========================================================
%% 3.7.1 T–F METHOD USING MORSE WAVELET
% tic
% figure
% % CWT function
% % cfs and F2 values are obtained internally for plotting
%
% % cwt(xn, Fs, 'morse');
% % title('CWT (Morse Wavelet), Default Parameters [3,60]');
%
% cwt(xn, Fs, 'morse', 'WaveletParameters', [12,440]);
% title('CWT (Morse Wavelet), [12,440]');
%
% toc % 1.97 s; 2 s on screen

% ===========================================================
%% 3.7.2 T–F METHOD USING BUMP WAVELET
% tic
% figure
% % CWT function using Bump wavelet:
% cwt(xn, Fs, 'bump');
% title('CWT (Bump Wavelet)');
% toc

% ===========================================================
%% 3.7.3 T–F METHOD USING MORLET WAVELET
% tic
% figure
% % CWT function
% cwt(xn, Fs, 'amor');
% title('CWT (Morlet Wavelet)');
% toc % 2.067 s; 3 s on screen

% ======================================================
%% 3.8 SUPERLETS ASLT
% % Use of the ASLT function:
% % Input parameters
% fois = 1:1:1000;    % buffer vector for the frequency axis range
% srord = [1, 30];    % cycle vector per frequency (40 is sufficient; no further gain)
%
% tic
% TF_ASLT = aslt(xn, Fs, fois, 5, srord, 0);
% toc % 29.5 s; 38 s on screen
%
% figure
% imagesc(t, fois, TF_ASLT);
% set(gca, 'ydir', 'normal');
% colormap jet;
% title('SUPERLETS ASLT');
% xlabel('t (s)');
% ylabel('F (Hz)');

% =====================================================
%% 3.9 SUPERLETS FASLT
% % Use of the FASLT function:
% fois = 1:1:1000;    % buffer vector for the frequency axis range
% srord2 = [1, 40];   % cycle vector per frequency (40 is sufficient; no further gain)
%
% tic
% TF_FASLT = faslt(xn, Fs, fois, 8, srord2, 0);
% toc % 41.12 s; 42 s on screen
%
% figure
% imagesc(t, fois, TF_FASLT);

