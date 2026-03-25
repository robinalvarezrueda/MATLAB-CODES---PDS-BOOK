%% PRACTICE 5.4. Summation of audio signals using decimation.


clc, close all, clear all
% Sum of two audio signals with different sampling frequencies:
[y1,fs1] = audioread('Birds.wav'); % Fs1 = 11025 Hz       
[y2,fs2] = audioread('UFO.wav');    % Fs2 = 44100 Hz       

% EXTRACTION OF A SINGLE CHANNEL IN CASE THE SIGNAL IS STEREO:
[rows1, cols1] = size(y1);
[rows2, cols2] = size(y2);

if cols1 == 2 
   y1_ch1 = y1(:,1);
end
if cols1 == 1 
   y1_ch1 = y1;
end

if cols2 == 2 
   y2_ch1 = y2(:,1);
end
if cols2 == 1 
   y2_ch1 = y2;
end

y1_channel = y1_ch1;          
y2_channel = y2_ch1;         

% Downsample to match the lower sampling frequency:
if fs1 > fs2
   Factor = fs1/fs2;
   
   % Check if the factor is integer:
   fractional_part = Factor - fix(Factor);
   
   % Apply downsample only for INTEGER FACTOR:
   if fractional_part == 0
      y1_channel = downsample(y1_channel, Factor); 
   else 
      disp('FACTOR MUST BE INTEGER') 
   end
end
 
if fs2 > fs1
   Factor = fs2/fs1;
   
   % Check if the factor is integer:
   fractional_part = Factor - fix(Factor);
   
   % Apply downsample only for INTEGER FACTOR:
   if fractional_part == 0
      y2_channel = downsample(y2_channel, Factor);
   else 
      disp('FACTOR MUST BE INTEGER')
   end
end

% Zero-padding the shorter signal and summing:
if length(y1_channel) < length(y2_channel)
   y1_padded = [y1_channel; zeros(length(y2_channel)-length(y1_channel),1)];
   y_sum = y1_padded + y2_channel;
else
   y2_padded = [y2_channel; zeros(length(y1_channel)-length(y2_channel),1)];
   y_sum = y2_padded + y1_channel;
end

sound(y_sum, fs1)