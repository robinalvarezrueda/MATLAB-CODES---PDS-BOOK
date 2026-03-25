%% PRACTICE 5.11. Relationship between Cross-Correlation and Convolution.

% Cross-Correlation obtained through Convolution:
clc,clear all,close all
% Data sequences:
x=[2,5,0,4];
y=[4,1,3,0];
R1=xcorr(x,y);
R2=conv(x,fliplr(y));
figure
subplot(2,2,1),stem(x),grid on
title('Signal 1')
subplot(2,2,2),stem(y),grid on
title('Signal 2') 
subplot(2,2,3),stem(R1),grid on
title('Cross-Correlation obtained via xcorr')
subplot(2,2,4),stem(R2),grid on
title('Cross-Correlation obtained via Convolution')
