%% PRACTICE 8.11 - PART2b. Real-time program

% REAL-TIME VOWEL CLASSIFICATION PROGRAM:
clc, close all, clear all
%% Record a vowel in less than 2 seconds:
Fs=44100; % Sampling frequency
audio = audiorecorder(Fs,16,1); % Create object to record voice
disp ('You have 2 seconds to pronounce a vowel');
recordblocking(audio,2); % Recording duration: 2 seconds
disp ('End of recording');
% play(audio); % Used to listen to the user audio.
y=getaudiodata(audio); % Store the acquired audio data in y

%% Compute the normalized periodogram of the acquired signal:
N = length(y);
nFFT = 2^ceil(log2(N))*64; % nFFT computation (time-domain samples)
Xn = fft(y, nFFT); % FFT complex coefficients computation
P = abs(Xn)/max(abs(Xn)); % Normalized periodogram
f = linspace(0, Fs, nFFT); % Frequency axis

%% Compute frequency bands CHARACTERISTIC OF EACH VOWEL:
% It has already been derived that there is a characteristic band per vowel:

% Vowel a: Band 1 -- (1200-1750) Hz
P_B1=P(find(f>=1200 & f<=1750));
f_B1=f(find(f>=1200 & f<=1750));
% Area under the curve over the interval:
B1_sum=sum(P_B1);

% Vowel e: Band 2 -- (2200-2600) Hz
P_B2=P(find(f>=2200 & f<=2600));
f_B2=f(find(f>=2200 & f<=2600));
% Area under the curve over the interval:
B2_sum=sum(P_B2);

% Vowels (i, u): Band 3 -- (450-510) Hz
P_B3=P(find(f>=450 & f<=510)); 
f_B3=f(find(f>=450 & f<=510));
% Area under the curve over the interval:
B3_sum=sum(P_B3);

% Vowel o: Band 4 -- (580-620) Hz
P_B4=P(find(f>=580 & f<=620));
f_B4=f(find(f>=580 & f<=620));
% Area under the curve over the interval:
B4_sum=sum(P_B4);

%% DECISION-MAKING BASED ON EACH CHARACTERISTIC BAND:
if (B1_sum > 15)
    disp('You pronounced the vowel "a".')
end
if (B2_sum > 30) 
    disp(You pronounced the vowel "e".')
end
if (B3_sum > 5) && (B3_sum < 12) 
    disp('You pronounced the vowel "i".')
end
if (B3_sum > 12)  
    disp('You pronounced the vowel "u".')
end
if  (B4_sum > 12) 
    disp('You pronounced the vowel "o".')
end
