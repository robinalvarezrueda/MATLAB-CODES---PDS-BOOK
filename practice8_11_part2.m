%% PRACTICE 8.11- Part 2. Differentiation among vowels pronounced by a person 

clc, close all, clear all
%% Audio file reading
% Vowel a
for i=1:1:10
    name=sprintf('a%d.wav', i);
    [vowel_a{i},Fs] = audioread([pwd '\VowelDatabase\', name]);
end
% Vowel e
for i=1:1:10
    name =sprintf('e%d.wav', i);
    [vowel_e{i},Fs] = audioread([pwd '\VowelDatabase\', name]);
end
% Vowel i
for i=1:1:10
    name =sprintf('i%d.wav', i);
    [vowel_i{i},Fs] = audioread([pwd '\BaseDatosVocales\', name]);
end
% Vowel o
for i=1:1:10
    name =sprintf('o%d.wav', i);
    [vowel_o{i},Fs] = audioread([pwd '\BaseDatosVocales\', name]);
end
% Vowel u
for i=1:1:10
    name =sprintf('u%d.wav', i);
    [vowel_u{i},Fs] = audioread([pwd '\BaseDatosVocales\', name]);
end

%% FREQUENCY DOMAIN: PERIODOGRAM COMPUTATION
% Periodogram computation:
N = length(vowel_a{1,1}); % Same length for the other vowels
nFFT = 2^ceil(log2(N))*1; % nFFT computation
 
f = linspace(0, Fs, nFFT); % Frequency axis
f = f(1:nFFT/2+1); % Half-period symmetry

%% For vowel "a":
for i=1:1:10
    Xn = fft(vowel_a{i}, nFFT); % FFT complex coefficients computation
    P = abs(Xn)/max(abs(Xn)); % Normalized periodogram
    P = P(1:nFFT/2+1); % Extract half-spectrum
    
    % Compute the 4 bands:
    % Band 1: (1200-1750) Hz
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_A(i,1) = sum(P_Area);
    Aa1(i)=sum(P_Area);
    % Band 2: (2200-2600) Hz
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_A(i,2) = sum(P_Area);
    Aa2(i)=sum(P_Area);
    % Band 3: (450-510) Hz
    P_Area=P(find(f>=450 & f<=510));
    Areas_A(i,3) = sum(P_Area);
    Aa3(i)=sum(P_Area);
    % Band 4: (580-620) Hz
    P_Area=P(find(f>=580 & f<=620));
    Areas_A(i,4) = sum(P_Area);
    Aa4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMS OF THE 10 VOWEL A SAMPLES');
    xlabel('Frequency [Hz]');
    ylabel('Amplitude');
    leyendas{i}=['a' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end
%legend(leyendas);
grid minor
hold off

%% For vowel "e":
figure
for i=1:1:10
    Xn = fft(vowel_e{i}, nFFT); % FFT complex coefficients computation
    P = abs(Xn)/max(abs(Xn)); % Normalized periodogram
    P = P(1:nFFT/2+1); % Extract half-spectrum
    % Compute the 4 bands:
    % Band 1: (1200-1750) Hz
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_E(i,1) = sum(P_Area);
    Ae1(i)=sum(P_Area);

    % Band 2: (2200-2600) Hz
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_E(i,2) = sum(P_Area);
    Ae2(i)=sum(P_Area);
    % Band 3: (450-510) Hz
    P_Area=P(find(f>=450 & f<=510));
    Areas_E(i,3) = sum(P_Area);
    Ae3(i)=sum(P_Area);
    % Band 4: (580-620) Hz
    P_Area=P(find(f>=580 & f<=620));
    Areas_E(i,4) = sum(P_Area);
    Ae4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMS OF THE 10 VOWEL E SAMPLES');
    xlabel('Frequency [Hz]');
    ylabel('Amplitude');
    leyendas{i}=['e' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end
grid minor
hold off

%% For vowel "i":
figure
for i=1:1:10
    Xn = fft(vowel_i{i}, nFFT); % FFT complex coefficients computation
    P = abs(Xn)/max(abs(Xn)); % Normalized periodogram
    P = P(1:nFFT/2+1); % Extract half-spectrum
    % Compute the 4 areas:
    % Band 1: (1200-1750) Hz
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_I(i,1) = sum(P_Area);
    Ai1(i)=sum(P_Area);
    % Band 2: (2200-2600) Hz
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_I(i,2) = sum(P_Area);
    Ai2(i)=sum(P_Area);
    % Band 3: (450-510) Hz
    P_Area=P(find(f>=450 & f<=510));
    Areas_I(i,3) = sum(P_Area);
    Ai3(i)=sum(P_Area);
    % Band 4: (580-620) Hz
    P_Area=P(find(f>=580 & f<=620));
    Areas_I(i,4) = sum(P_Area);
    Ai4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMS OF THE 10 VOWEL I SAMPLES');
    xlabel('Frequency [Hz]');
    ylabel('Amplitude');
    leyendas{i}=['i' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end
%legend(leyendas);
grid minor
hold off

%% For vowel "o":
figure
for i=1:1:10
    Xn = fft(vowel_o{i}, nFFT); % FFT complex coefficients computation
    P = abs(Xn)/max(abs(Xn)); % Normalized periodogram
    P = P(1:nFFT/2+1); % Extract half-spectrum

    % Compute the 4 areas:
    % Band 1: (1200-1750) Hz
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_O(i,1) = sum(P_Area);
    Ao1(i)=sum(P_Area);
    % Band 2: (2200-2600) Hz
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_O(i,2) = sum(P_Area);
    Ao2(i)=sum(P_Area);
    % Band 3: (450-510) Hz
    P_Area=P(find(f>=450 & f<=510));
    Areas_O(i,3) = sum(P_Area);
    Ao3(i)=sum(P_Area);
    % Band 4: (580-620) Hz
    P_Area=P(find(f>=580 & f<=620));
    Areas_O(i,4) = sum(P_Area);
    Ao4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMS OF THE 10 VOWEL O SAMPLES');
    xlabel('Frequency [Hz]');
    ylabel('Amplitude');
    leyendas{i}=['o' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end
grid minor
hold off

%% For vowel "u":
figure
for i=1:1:10
    Xn = fft(vowel_u{i}, nFFT); % FFT complex coefficients computation
    P = abs(Xn)/max(abs(Xn)); % Normalized periodogram
    P = P(1:nFFT/2+1); % Extract half-spectrum

    % Compute the 4 areas:
    % Band 1: (1200-1750) Hz
    P_Area=P(find(f>=1200 & f<=1750));
    Areas_U(i,1) = sum(P_Area);
    Au1(i)=sum(P_Area);
    % Band 2: (2200-2600) Hz
    P_Area=P(find(f>=2200 & f<=2600));
    Areas_U(i,2) = sum(P_Area);
    Au2(i)=sum(P_Area);
    % Band 3: (450-510) Hz
    P_Area=P(find(f>=450 & f<=510));
    Areas_U(i,3) = sum(P_Area);
    Au3(i)=sum(P_Area);
    % Band 4: (580-620) Hz
    P_Area=P(find(f>=580 & f<=620));
    Areas_U(i,4) = sum(P_Area);
    Au4(i)=sum(P_Area);
    hold on
    plot(f, P);
    grid minor
    title('PERIODOGRAMS OF THE 10 VOWEL U SAMPLES');
    xlabel('Frequency [Hz]');
    ylabel('Amplitude');
    leyendas{i}=['u' num2str(i)];
    axis([0 Fs/6 0 max(P)]);
end
grid minor
hold off

%% BOX-AND-WHISKER PLOTS FOR EACH FREQUENCY BAND:
figure
Areas=[Aa1 Ae1 Ai1 Ao1 Au1]';
Vowels=importdata("Vowels.txt");
subplot(1,4,1)
boxplot(Areas, Vowels)
title('Variable 1: Band from 1200 to 1750 Hz')
yline(15,'g')
grid minor
Areas2=[Aa2 Ae2 Ai2 Ao2 Au2]';
subplot(1,4,2)
boxplot(Areas2,Vowels)
title('Variable 2: Band from 2200 to 2600 Hz')
yline(30,'g')
grid minor
Areas3=[Aa3 Ae3 Ai3 Ao3 Au3]';
subplot(1,4,3)
boxplot(Areas3,Vowels)
title('Variable 3: Band from 450 to 510 Hz')
yline(12,'g')
yline(5,'g')
grid minor
Areas4=[Aa4 Ae4 Ai4 Ao4 Au4]';
subplot(1,4,4)
boxplot(Areas4,Vowels)
title('Variable 4: Band from 580 to 620 Hz')
yline(12,'g')
grid minor
