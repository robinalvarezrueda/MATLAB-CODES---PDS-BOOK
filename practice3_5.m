%% PRACTICE 3.5. Reconstruction of a signal from discrete samples.

clc, close all, clear all
%a) Generation of the 5 sinc functions shifted to their respective time instants:
tn = -10:0.1:10;
y1 = sinc(tn);
y2 = sinc(tn-0.3);
y3 = sinc(tn-0.5);
y4 = sinc(tn-0.7);
y5 = sinc(tn-0.9);
timeinstants = [0 0.3 0.5 0.7 0.9];
samples = [0.1 -0.2 0.3 -0.4 0.5];
subplot(2,2,1)
stem(timeinstants, samples,'LineStyle',':','Marker','o','LineWidth',1.0)
grid minor
xlim([-1 5])
title('Taken samples')
subplot(2,2,2)
plot(tn,y1,tn,y2,tn,y3,tn,y4,tn,y5,'LineWidth',1.5)
grid minor
xlim([-1 5])
title('SINCs shifted toward their respective sample locations')
legend('sinc(t)','sinc(t-0.3)','sinc(t-0.5)','sinc(t-0.7)','sinc(t-0.9)')

%% b) Multiplication of each shifted sinc function by its corresponding sample value:
y1 = y1*0.1;
y2 = y2*(-0.2);
y3 = y3*0.3;
y4 = y4*(-0.4);
y5 = y5*0.5;
subplot(2,2,3)
plot(tn,y1,tn,y2,tn,y3,tn,y4,tn,y5,'LineWidth',1.5)
grid minor
xlim([-1 5])
title('Samples x sinc')
legend('sinc(t)*x[0]','sinc(t-0.3) *x[1]','sinc(t-0.5) *x[2]','sinc(t-0.7) *x[2]','sinc(t-0.9) *x[3]')

%% c) Sum of all the contributions from the previous step to obtain the recovered signal:
Y_recover = y1+y2+y3+y4+y5;
subplot(2,2,4)
plot(tn, Y_recover,'LineWidth',2,'Color','red');
grid minor
xlim([-1 5])
title('Reconstructed signal')
