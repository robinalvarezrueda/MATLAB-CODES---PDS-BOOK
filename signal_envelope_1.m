function [df1,df2,df3,df4,df5,df6,df7,df8] = signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8)
  gest1 = c1; gest2 = c2; gest3 = c3; gest4 = c4; gest5 = c5; gest6 = c6; gest7 = c7; gest8 = c8;
% ENVELOPE OF CHANNEL 1
    df1=envelope(gest1,3,'peak'); % envelope using cubic spline interpolation method
% ENVELOPE OF CHANNEL 2   
    df2=envelope(gest2,3,'peak'); 
% ENVELOPE OF CHANNEL 3
    df3=envelope(gest3,3,'peak'); 
% ENVELOPE OF CHANNEL 4
    df4=envelope(gest4,3,'peak'); 
% ENVELOPE OF CHANNEL 5
    df5=envelope(gest5,3,'peak'); 
% ENVELOPE OF CHANNEL 6
    df6=envelope(gest6,3,'peak'); 
% ENVELOPE OF CHANNEL 7
    df7=envelope(gest7,3,'peak'); 
% ENVELOPE OF CHANNEL 8
    df8=envelope(gest8,3,'peak'); 
end
