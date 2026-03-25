function [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45] = signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8) 
Fs= 200;
Fmax = Fs/2;
f1=[0  3  5  40  45 Fmax]/(Fmax); 
m1=[0  0  1  1   0   0   ];

% FIR FILTER (REMEZ): 
FIR_order=100;
b2 = remez(FIR_order, f1, m1); 
%% Obtaining the filtered signal using FILTER:
c1_filt_5_45=filter(b2,1,c1);
c2_filt_5_45=filter(b2,1,c2);
c3_filt_5_45=filter(b2,1,c3);
c4_filt_5_45=filter(b2,1,c4);
c5_filt_5_45=filter(b2,1,c5);
c6_filt_5_45=filter(b2,1,c6);
c7_filt_5_45=filter(b2,1,c7);
c8_filt_5_45=filter(b2,1,c8);
end
