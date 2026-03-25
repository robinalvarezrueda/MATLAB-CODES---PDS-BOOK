%% PRACTICE 8.11 - Automatic file reading. 

clc, close all, clear all
%% Automatic file reading:
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

% Storage into matrices:
% One matrix for "a", another for "e", etc.
for j=1:10
   y_a(:,j) = vowel_a{j};
   y_e(:,j) = vowel_e{j};
   y_i(:,j) = vowel_i{j};
   y_o(:,j) = vowel_o{j};
   y_u(:,j) = vowel_u{j};
end

% Overlaid time-domain plots:
for j=1:10
    figure(1)
    hold on
    plot(y_a(:,j))
    title('vowel "a"')
    legend({'A1','A2','A3','A4','A5','A6','A7','A8','A9','A10'})
    figure(2)
    hold on
    plot(y_e(:,j))
    title('vowel "e"')
    legend({'E1','E2','E3','E4','E5','E6','E7','E8','E9','E10'})
    figure(3)
    hold on
    plot(y_i(:,j))
    title('vowel "i"')
    legend({'I1','I2','I3','I4','I5','I6','I7','I8','I9','I10'})
    figure(4)
    hold on
    plot(y_o(:,j))
    title('vowel "o"')
    legend({'O1','O2','O3','O4','O5','O6','O7','O8','O9','O10'})
    figure(5)
    hold on
    plot(y_u(:,j))
    title('vowel "u"')
    legend({'U1','U2','U3','U4','U5','U6','U7','U8','U9','U10'})
end
