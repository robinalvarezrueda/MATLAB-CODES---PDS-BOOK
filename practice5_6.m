%% PRACTICE 5.6. Comparison of interpolation methods in time-domain signals.

clc, clear all, close all
% Experimental Data:
x = 0:pi/4:2*pi; y = sin(x);
% New points to interpolate:
xq = 0:pi/16:2*pi;
% Real signal points:
xn = 0:pi/32:2*pi; 
y_real = sin(xn);
%% INTERPOLATION TECHNIQUES:
Interp_lineal = interp1(x,y,xq);  % Linear interpolation by default
Interp_spline = interp1(x,y,xq,'spline'); % Spline interpolation
Interp_pchip = interp1(x,y,xq,'pchip');  % PCHIP interpolation
Interp_cubic = interp1(x,y,xq,'cubic'); % Cubic interpolation
Interp_makima = interp1(x,y,xq,'makima'); % Makima interpolation
subplot(2,2,1)
plot(x,y,'o',xq,Interp_lineal,'*',xn,y_real,'+');
legend('Original data','Interpolated points','Real signal');
title('Linear interpolation (default)');
subplot(2,2,2)
plot(x,y,'o',xq,Interp_spline,'*',xn,y_real,'+'); 
legend('Original data','Interpolated points','Real signal');
title('Spline interpolation');
subplot(2,2,3)
plot(x,y,'o',xq,Interp_pchip,'*',xn,y_real,'+'); 
legend('Original data','Interpolated points','Real signal');
title('PCHIP interpolation');
subplot(2,2,4)
plot(x,y,'o',xq,Interp_makima,'*',xn,y_real,'+'); 
legend('Original data','Interpolated points','Real signal');
title('Makima interpolation');

