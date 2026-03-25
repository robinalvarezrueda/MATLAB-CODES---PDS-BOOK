%% PRACTICE 5.8. Custom implementation of cross-correlation.

clc,clear all,close all
%% Cross-Correlation Implementation:
x = [2 5 0 4]; % Sequence 1
h = [4 1 3 0]; % Sequence 2
Lx = length(x); % Length of Sequence 1
Lh = length(h); % Length of Sequence 2
y = fliplr(h); % Inversion of Sequence 2
%% Using MATLAB's Built-in Function (xcorr):
z = xcorr(x,h);
disp('Cross-correlation using MATLAB''s default function z[n]')
disp(z)
%% Custom Implementation: Cross-correlation using a 'for' loop
len=Lx+Lh-1;
for n=1:len
    corr(n)=0;
    for k=1:Lx
        if((n-k)>=0 && (n-k)<Lh)
            corr(n)=corr(n)+x(k).*y(n-k+1);
        end
    end
end
disp('Our custom cross-correlation implementation is')
disp(corr)
subplot(2, 2, 1)
stem(x)
title('First Sequence x[n]')
xlabel('Samples'), ylabel('Amplitude'), grid minor
subplot(2, 2, 2)
stem(h)
title('Second Sequence h[n]')
xlabel('Samples'), ylabel('Amplitude'), grid minor
subplot(2, 2, 3)
stem(z)
title('Cross-correlation Rxy[n] - custom')
xlabel('Samples'), ylabel('Amplitude'), grid minor
subplot(2,2,4)
stem(z)
title('Cross-correlation Rxy[n] using MATLAB xcorr')
xlabel('Samples'), ylabel('Amplitude'), grid minor
