function [wt]=my_hamming(n)
k=1:1:n-1;
w(k+1)=0.54-0.46*(cos(2*pi*(k/(n-1))));
wt=w';
