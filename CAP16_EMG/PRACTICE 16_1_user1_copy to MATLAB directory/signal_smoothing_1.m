function [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8] = signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8)
  window = 15;
  Amean1 = 1.2*movmean(c1,window);
  Amean2 = 1.2*movmean(c2,window);
  Amean3 = 1.2*movmean(c3,window);
  Amean4 = 1.2*movmean(c4,window);
  Amean5 = 1.2*movmean(c5,window);
  Amean6 = 1.2*movmean(c6,window);
  Amean7 = 1.2*movmean(c7,window);
  Amean8 = 1.2*movmean(c8,window);
end
