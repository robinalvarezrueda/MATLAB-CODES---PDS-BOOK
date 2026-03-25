%% PRACTICE 16.1 FULL PROGRAM FOR USER 1:

clc, clear all, close all

%% PREPROCESSING ALGORITHM SELECTION:

% USEFUL SIGNAL EXTRACTION
      % To activate, just uncomment:
      extraction = 1; % 'yes';
      %extraction = 2; % 'no';

% SAMPLE EQUALIZATION
      % To activate, just uncomment:
      equalization = 1; % 'yes';
      %equalization = 2; % 'no';

% RECTIFICATION
      % To activate, just uncomment:
      rectification = 1; % 'yes';
      %rectification = 2; % 'no';

% ENVELOPE
      % To activate, just uncomment:
      %envelope = 1; % 'yes';
      envelope = 2; % 'no';

% CURVE SMOOTHING  
      % To activate, just uncomment:
      %smoothing = 1; % 'yes'; 
      smoothing = 2; % 'no'; 

% High-pass filtering (> 5 Hz): removes all components below 5 Hz
      % To activate, uncomment yes and comment no:
      %filter_5 = 1; % 'yes';
      filter_5 = 2; % 'no';

% Band-pass filtering (5 Hz - 45 Hz): allows only components between 5 and 45 Hz
      % To activate, just uncomment:
      %filter_5_45 = 1; % 'yes';
      filter_5_45 = 2; % 'no';

%% ------------------------------------------------------------------------
%------------------------'Complexity domain analysis'----------------------
load SIGNALS_EMG_USER_FIST.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 % 'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICATION
    if  rectification == 1 % 'yes'
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=envelope_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
    
    % CURVE SMOOTHING       
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end

    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 % 'yes'
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 % 'yes'
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    % FRACTAL DIMENSION       
            [KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8] = Katz_FD(c1,c2,c3,c4,c5,c6,c7,c8);
    % DECIMAL EXTRACTION
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = decimales(KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8);        
             TOTALS1(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_WAVE_IN.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 % 'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICATION
    if  rectification == 1 % 'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end

    % CURVE SMOOTHING      
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end

    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 % 'yes';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 % 'yes';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    % FRACTAL DIMENSION      
            [KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8] = Katz_FD(c1,c2,c3,c4,c5,c6,c7,c8);
    % DECIMAL EXTRACTION
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = decimales(KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8);
             TOTALS2(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_WAVE_OUT.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 % 'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end
   
    % RECTIFICATION
    if  rectification == 1 % 'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
    
    % CURVE SMOOTHING      
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 % 'yes';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 % 'yes';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    % FRACTAL DIMENSION      
            [KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8] = Katz_FD(c1,c2,c3,c4,c5,c6,c7,c8);
    % DECIMAL EXTRACTION
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = decimales(KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8);      
             TOTALS3(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_OPEN.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 % 'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICATION
    if  rectification == 1 % 'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
    
    % CURVE SMOOTHING      
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 % 'yes';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 % 'yes';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    % FRACTAL DIMENSION      
            [KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8] = Katz_FD(c1,c2,c3,c4,c5,c6,c7,c8);
    % DECIMAL EXTRACTION
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = decimales(KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8);
             TOTALS4(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_PINCH.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 %'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 %'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICATION
    if  rectification == 1 %'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 %'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end

    % CURVE SMOOTHING       
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 %'yes';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 %'yes';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    % FRACTAL DIMENSION       
            [KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8] = Katz_FD(c1,c2,c3,c4,c5,c6,c7,c8);
    % DECIMAL EXTRACTION
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = decimales(KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8);
             TOTALS5(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

DOM_COMPLEXITY=[TOTALS1;TOTALS2;TOTALS3;TOTALS4;TOTALS5];
clear TOTALS1 TOTALS2 TOTALS3 TOTALS4 TOTALS5
clear canal_1 canal_2 canal_3 canal_4 canal_5
clear total_1 total_2 total_3 total_4 total_5

%% ------------------------------------------------------------------------
%------------------------'Frequency domain analysis'-----------------------
load SIGNALS_EMG_USER_FIST.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);

     %% PREPROCESSING:

    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 %'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 %'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICATION
    if  rectification == 1 %'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 %'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
    
    % CURVE SMOOTHING       
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 %'yes';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 %'yes';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    %% FEATURE EXTRACTION:

    % PERIODOGRAM
             [Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8] = periodogram_1(c1,c2,c3,c4,c5,c6,c7,c8);
     
    % AREA UNDER THE CURVE
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8); % with rectification and smoothing
            
            TOTALS1(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8]; 
end


load SIGNALS_EMG_USER_WAVE_IN.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);

    %% PREPROCESSING:

    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 % 'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICATION
    if  rectification == 1 % 'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
    
    % CURVE SMOOTHING       
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 % 'yes'
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 % 'yes'
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    %% FEATURE EXTRACTION:

    % PERIODOGRAM
             [Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8] = periodogram_1(c1,c2,c3,c4,c5,c6,c7,c8);
     
    % AREA UNDER THE CURVE
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8); % with rectification and smoothing
            
            TOTALS2(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_WAVE_OUT.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);

     %% PREPROCESSING:

    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 % 'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICATION
    if  rectification == 1 % 'yes'
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
    
    % CURVE SMOOTHING       
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 % 'yes'
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 % 'yes'
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    %% FEATURE EXTRACTION:

    % PERIODOGRAM
             [Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8] = periodogram_1(c1,c2,c3,c4,c5,c6,c7,c8);
     
    % AREA UNDER THE CURVE
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8);
            
            TOTALS3(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_OPEN.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);

       %% PREPROCESSING:

% USEFUL SIGNAL EXTRACTION (RECOGNITION)
if  extraction == 1 % 'yes'
    [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
end

% SAMPLE EQUALIZATION
 if  equalization == 1 % 'yes'
       [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
       c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
 end

% RECTIFICATION
if  rectification == 1 % 'yes'
    %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
    [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
end

% ENVELOPE
if  envelope == 1 % 'yes'
    [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
end

% CURVE SMOOTHING       
if  smoothing == 1 % 'yes'
    [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
end

% High-pass filtering (> 5 Hz)
if  filter_5 == 1 % 'yes'
    [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
end 

% Band-pass filtering (5 Hz - 45 Hz)
if  filter_5_45 == 1 % 'yes'
  [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
  c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
end 

%% FEATURE EXTRACTION:
% PERIODOGRAM
         [Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8] = periodogram_1(c1,c2,c3,c4,c5,c6,c7,c8);

% AREA UNDER THE CURVE
        [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8); % with rectification and smoothing
        
        TOTALS4(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_PINCH.mat
for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);

     %% PREPROCESSING:

    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 % 'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICATION
    if  rectification == 1 % 'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
    
    % CURVE SMOOTHING       
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 % 'yes'
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 % 'yes'
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

    %% FEATURE EXTRACTION:

    % PERIODOGRAM
             [Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8] = periodogram_1(c1,c2,c3,c4,c5,c6,c7,c8);
     
    % AREA UNDER THE CURVE
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(Pn1,Pn2,Pn3,Pn4,Pn5,Pn6,Pn7,Pn8);
            
            TOTALS5(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

DOM_FREQUENCY=[TOTALS1;TOTALS2;TOTALS3;TOTALS4;TOTALS5];
clear TOTALS1 TOTALS2 TOTALS3 TOTALS4 TOTALS5
clear canal_1 canal_2 canal_3 canal_4 canal_5
clear total_1 total_2 total_3 total_4 total_5


%% ----------------------------------------------------------------------
%------------------------'Time domain analysis'-----------------------
load SIGNALS_EMG_USER_FIST.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);

       % USEFUL SIGNAL EXTRACTION (RECOGNITION)
if extraction == 1 % 'yes'
    [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8] = signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1 = gp1; c2 = gp2; c3 = gp3; c4 = gp4; c5 = gp5; c6 = gp6; c7 = gp7; c8 = gp8;
end

% SAMPLE EQUALIZATION
if equalization == 1 % 'yes'
    [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8] = signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1 = ges1; c2 = ges2; c3 = ges3; c4 = ges4; c5 = ges5; c6 = ges6; c7 = ges7; c8 = ges8;
end

% RECTIFICATION
if rectification == 1 % 'yes'
    %[c1,c2,c3,c4,c5,c6,c7,c8] = signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
    [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8] = signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1 = gest1; c2 = gest2; c3 = gest3; c4 = gest4; c5 = gest5; c6 = gest6; c7 = gest7; c8 = gest8;
end

% ENVELOPE
if envelope == 1 % 'yes'
    [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8] = signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1 = ba1; c2 = ba2; c3 = ba3; c4 = ba4; c5 = ba5; c6 = ba6; c7 = ba7; c8 = ba8;
end

% CURVE SMOOTHING       
if smoothing == 1 % 'yes'
    [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8] = signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1 = Amean1; c2 = Amean2; c3 = Amean3; c4 = Amean4; c5 = Amean5; c6 = Amean6; c7 = Amean7; c8 = Amean8;
end

% High-pass filtering (> 5 Hz)
if filter_5 == 1 % 'yes'
    [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5] = signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1 = c1_filt_5; c2 = c2_filt_5; c3 = c3_filt_5; c4 = c4_filt_5; c5 = c5_filt_5; c6 = c6_filt_5; c7 = c7_filt_5; c8 = c8_filt_5;
end 

% Band-pass filtering (5 Hz - 45 Hz)
if filter_5_45 == 1 % 'yes'
    [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45] = signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
    c1 = c1_filt_5_45; c2 = c2_filt_5_45; c3 = c3_filt_5_45; c4 = c4_filt_5_45; c5 = c5_filt_5_45; c6 = c6_filt_5_45; c7 = c7_filt_5_45; c8 = c8_filt_5_45;
end 

%% FEATURE EXTRACTION:  

% AREA UNDER THE CURVE
[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(c1,c2,c3,c4,c5,c6,c7,c8);
TOTALS1(i,:) = [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_WAVE_IN.mat

for i=1:1:25
    c1 = EMG{i}(:,1);
    c2 = EMG{i}(:,2);
    c3 = EMG{i}(:,3);
    c4 = EMG{i}(:,4);
    c5 = EMG{i}(:,5);
    c6 = EMG{i}(:,6);
    c7 = EMG{i}(:,7);
    c8 = EMG{i}(:,8);
            
    %% PREPROCESSING:

    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8] = signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = gp1; c2 = gp2; c3 = gp3; c4 = gp4; c5 = gp5; c6 = gp6; c7 = gp7; c8 = gp8;
    end

    % SAMPLE EQUALIZATION
    if equalization == 1 % 'yes'
        [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8] = signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = ges1; c2 = ges2; c3 = ges3; c4 = ges4; c5 = ges5; c6 = ges6; c7 = ges7; c8 = ges8;
    end

    % RECTIFICATION
    if rectification == 1 % 'yes'
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8] = signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = gest1; c2 = gest2; c3 = gest3; c4 = gest4; c5 = gest5; c6 = gest6; c7 = gest7; c8 = gest8;
    end

    % ENVELOPE
    if envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8] = signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = ba1; c2 = ba2; c3 = ba3; c4 = ba4; c5 = ba5; c6 = ba6; c7 = ba7; c8 = ba8;
    end

    % CURVE SMOOTHING       
    if smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8] = signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = Amean1; c2 = Amean2; c3 = Amean3; c4 = Amean4; c5 = Amean5; c6 = Amean6; c7 = Amean7; c8 = Amean8;
    end

    % High-pass filtering (> 5 Hz)
    if filter_5 == 1 % 'yes'
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5] = signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = c1_filt_5; c2 = c2_filt_5; c3 = c3_filt_5; c4 = c4_filt_5; c5 = c5_filt_5; c6 = c6_filt_5; c7 = c7_filt_5; c8 = c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if filter_5_45 == 1 % 'yes'
        [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45] = signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = c1_filt_5_45; c2 = c2_filt_5_45; c3 = c3_filt_5_45; c4 = c4_filt_5_45; c5 = c5_filt_5_45; c6 = c6_filt_5_45; c7 = c7_filt_5_45; c8 = c8_filt_5_45;
    end 

    %% FEATURE EXTRACTION:  
   
    % AREA UNDER THE CURVE
    [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(c1,c2,c3,c4,c5,c6,c7,c8);
    TOTALS2(i,:) = [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_WAVE_OUT.mat

for i=1:1:25
    c1 = EMG{i}(:,1);
    c2 = EMG{i}(:,2);
    c3 = EMG{i}(:,3);
    c4 = EMG{i}(:,4);
    c5 = EMG{i}(:,5);
    c6 = EMG{i}(:,6);
    c7 = EMG{i}(:,7);
    c8 = EMG{i}(:,8);
     
    %% PREPROCESSING:

    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if extraction == 1 % 'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8] = signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = gp1; c2 = gp2; c3 = gp3; c4 = gp4; c5 = gp5; c6 = gp6; c7 = gp7; c8 = gp8;
    end

    % SAMPLE EQUALIZATION
    if equalization == 1 % 'yes'
        [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8] = signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = ges1; c2 = ges2; c3 = ges3; c4 = ges4; c5 = ges5; c6 = ges6; c7 = ges7; c8 = ges8;
    end
    
    % RECTIFICATION
    if rectification == 1 % 'yes'
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8] = signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = gest1; c2 = gest2; c3 = gest3; c4 = gest4; c5 = gest5; c6 = gest6; c7 = gest7; c8 = gest8;
    end

    % ENVELOPE
    if envelope == 1 % 'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8] = signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = ba1; c2 = ba2; c3 = ba3; c4 = ba4; c5 = ba5; c6 = ba6; c7 = ba7; c8 = ba8;
    end
    
    % CURVE SMOOTHING       
    if smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8] = signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = Amean1; c2 = Amean2; c3 = Amean3; c4 = Amean4; c5 = Amean5; c6 = Amean6; c7 = Amean7; c8 = Amean8;
    end
   
    % High-pass filtering (> 5 Hz)
    if filter_5 == 1 % 'yes'
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5] = signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = c1_filt_5; c2 = c2_filt_5; c3 = c3_filt_5; c4 = c4_filt_5; c5 = c5_filt_5; c6 = c6_filt_5; c7 = c7_filt_5; c8 = c8_filt_5;
    end 
   
    % Band-pass filtering (5 Hz - 45 Hz)
    if filter_5_45 == 1 % 'yes'
        [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45] = signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1 = c1_filt_5_45; c2 = c2_filt_5_45; c3 = c3_filt_5_45; c4 = c4_filt_5_45; c5 = c5_filt_5_45; c6 = c6_filt_5_45; c7 = c7_filt_5_45; c8 = c8_filt_5_45;
    end 

    %% FEATURE EXTRACTION:  
   
    % AREA UNDER THE CURVE
    [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(c1,c2,c3,c4,c5,c6,c7,c8);
    TOTALS3(i,:) = [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_OPEN.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    %% PREPROCESSING:

    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 %'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 %'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end
    
    % RECTIFICATION
    if  rectification == 1 %'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 %'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
    
    % CURVE SMOOTHING       
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 %'yes';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 %'yes';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

%% FEATURE EXTRACTION:  
   
% AREA UNDER THE CURVE
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(c1,c2,c3,c4,c5,c6,c7,c8);
            TOTALS4(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load SIGNALS_EMG_USER_PINCH.mat

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    %% PREPROCESSING:
       
    % USEFUL SIGNAL EXTRACTION (RECOGNITION)
    if  extraction == 1 %'yes'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % SAMPLE EQUALIZATION
     if  equalization == 1 %'yes'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=signal_equalization_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1;
           c2=ges2;
           c3=ges3;
           c4=ges4;
           c5=ges5;
           c6=ges6;
           c7=ges7;
           c8=ges8;
     end
   
    % RECTIFICATION
    if  rectification == 1 %'yes'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=signal_rectification_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVELOPE
    if  envelope == 1 %'yes'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=signal_envelope_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end
   
    % CURVE SMOOTHING       
    if  smoothing == 1 % 'yes'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=signal_smoothing_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % High-pass filtering (> 5 Hz)
    if  filter_5 == 1 %'yes';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=signal_filtering_5_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
   
    % Band-pass filtering (5 Hz - 45 Hz)
    if  filter_5_45 == 1 %'yes';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=signal_filtering_5_45_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

%% FEATURE EXTRACTION:  
   
% AREA UNDER THE CURVE
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(c1,c2,c3,c4,c5,c6,c7,c8);
            TOTALS5(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

DOM_TIME=[TOTALS1;TOTALS2;TOTALS3;TOTALS4;TOTALS5];

%--------------------------------------------------------------------------
% Alternative 1:
% G1=DOM_TIME./max(max(DOM_TIME));
% G2=DOM_FREQUENCY./max(max(DOM_FREQUENCY));
% G3=DOM_COMPLEXITY./max(max(DOM_COMPLEXITY));

G1=DOM_TIME;
G2=DOM_FREQUENCY;
G3=DOM_COMPLEXITY;
% %--------------------------------------------------------------------------

[A B C D]=pca(G1,'NumComponents',2); % Principal components are in B

% NORMALIZATION OF THE TWO PRINCIPAL COMPONENTS (DIVIDE BY RANGE IN X AND Y):
% Col 1 is X, Col 2 is Y
Bx=B(:,1);
By=B(:,2);
Rango_x=max(Bx)-min(Bx);
Rango_y=max(By)-min(By);

Bx_norm = Bx/Rango_x;
By_norm = By/Rango_y;

B_norm = [Bx_norm By_norm];
B = B_norm;

% CENTROIDS:
F1=mean(B(1:25,1)); % Mean value of PC1 (Time domain)(Fist) 
F2=mean(B(1:25,2)); % Mean value of PC2 (Time domain)(Fist) 

WI1=mean(B(26:50,1)); % (Wave In)
WI2=mean(B(26:50,2));

WO1=mean(B(51:75,1)); % (Wave Out)
WO2=mean(B(51:75,2));

OP1=mean(B(76:100,1)); % (Open)
OP2=mean(B(76:100,2));

PI1=mean(B(101:125,1)); % (Pinch)
PI2=mean(B(101:125,2));

% DISPERSIONS:
SF1=std(B(1:25,1)); 
SF2=std(B(1:25,2)); 

SWI1=std(B(26:50,1)); 
SWI2=std(B(26:50,2)); 

SWO1=std(B(51:75,1)); 
SWO2=std(B(51:75,2)); 

SOP1=std(B(76:100,1)); 
SOP2=std(B(76:100,2)); 

SPI1=std(B(101:125,1)); 
SPI2=std(B(101:125,2)); 

% DISTANCES BETWEEN CENTROIDS:
FIWI=num2str(sqrt((F1-WI1)^2+(F2-WI2)^2),2);
FIWO=num2str(sqrt((F1-WO1)^2+(F2-WO2)^2),2);
FIOP=num2str(sqrt((F1-OP1)^2+(F2-OP2)^2),2);
FIPI=num2str(sqrt((F1-PI1)^2+(F2-PI2)^2),2);
WIWO=num2str(sqrt((WI1-WO1)^2+(WI2-WO2)^2),2);
WIOP=num2str(sqrt((WI1-OP1)^2+(WI2-OP2)^2),2);
WIPI=num2str(sqrt((WI1-PI1)^2+(WI2-PI2)^2),2);
WOOP=num2str(sqrt((WO1-OP1)^2+(WO2-OP2)^2),2);
WOPI=num2str(sqrt((WO1-PI1)^2+(WO2-PI2)^2),2);
OPPI=num2str(sqrt((OP1-PI1)^2+(OP2-PI2)^2),2);

% PLOTS:
figure(1)
subplot(1,3,1)
plot(B(1:25,1),B(1:25,2),'*r')
hold on
plot(B(26:50,1),B(26:50,2),'vm')
plot(B(51:75,1),B(51:75,2),'ob')
plot(B(76:100,1),B(76:100,2),'s')
plot(B(101:125,1),B(101:125,2),'d')

plot(F1,F2,'ok','LineWidth',3)
plot(WI1,WI2,'ok','LineWidth',3)
plot(WO1,WO2,'ok','LineWidth',3)
plot(OP1,OP2,'ok','LineWidth',3)
plot(PI1,PI2,'ok','LineWidth',3)

title('Time Domain')
grid on
grid minor

clear F1 F2 WI1 WI2 WO1 WO2 OP1 OP2 PI1 PI2 FIWI FIWO FIOP FIPI WIWO WIOP WIPI WOOP WOPI OPPI

%% --------------------------------------------------------------------

[A B C D]=pca(G2,'NumComponents',2);

% NORMALIZATION OF THE TWO PRINCIPAL COMPONENTS (DIVIDE BY RANGES IN X AND Y:
% Col 1 is X, Col 2 is Y: ranges of both columns
Bx=B(:,1);
By=B(:,2);
Range_x=max(Bx)-min(Bx);
Range_y=max(By)-min(By);

Bx_norm = Bx/Range_x;
By_norm = By/Range_y;

B_norm = [Bx_norm By_norm];
B = B_norm;

% CENTROIDS:
F1=mean(B(1:25,1));
F2=mean(B(1:25,2));

WI1=mean(B(26:50,1));
WI2=mean(B(26:50,2));

WO1=mean(B(51:75,1));
WO2=mean(B(51:75,2));

OP1=mean(B(76:100,1));
OP2=mean(B(76:100,2));

PI1=mean(B(101:125,1));
PI2=mean(B(101:125,2));

SF1=std(B(1:25,1))
SF2=std(B(1:25,2))

SWI1=std(B(26:50,1))
SWI2=std(B(26:50,2))

SWO1=std(B(51:75,1))
SWO2=std(B(51:75,2))

SOP1=std(B(76:100,1))
SOP2=std(B(76:100,2))

SPI1=std(B(101:125,1))
SPI2=std(B(101:125,2))

FIWI=num2str(sqrt((F1-WI1)^2+(F2-WI2)^2),2)
FIWO=num2str(sqrt((F1-WO1)^2+(F2-WO2)^2),2)
FIOP=num2str(sqrt((F1-OP1)^2+(F2-OP2)^2),2)
FIPI=num2str(sqrt((F1-PI1)^2+(F2-PI2)^2),2)
WIWO=num2str(sqrt((WI1-WO1)^2+(WI2-WO2)^2),2)
WIOP=num2str(sqrt((WI1-OP1)^2+(WI2-OP2)^2),2)
WIPI=num2str(sqrt((WI1-PI1)^2+(WI2-PI2)^2),2)
WOOP=num2str(sqrt((WO1-OP1)^2+(WO2-OP2)^2),2)
WOPI=num2str(sqrt((WO1-PI1)^2+(WO2-PI2)^2),2)
OPPI=num2str(sqrt((OP1-PI1)^2+(OP2-PI2)^2),2)

subplot(1,3,2)
plot(B(1:25,1),B(1:25,2),'*r')
hold on
plot(B(26:50,1),B(26:50,2),'vm')
plot(B(51:75,1),B(51:75,2),'ob')
plot(B(76:100,1),B(76:100,2),'s')
plot(B(101:125,1),B(101:125,2),'d')

plot(F1,F2,'ok','LineWidth',3)

plot(WI1,WI2,'ok','LineWidth',3)
plot(WO1,WO2,'ok','LineWidth',3)
plot(OP1,OP2,'ok','LineWidth',3)
plot(PI1,PI2,'ok','LineWidth',3)

line([F1;WI1],[F2;WI2])
line([F1,WO1],[F2,WO2])
line([F1,OP1],[F2,OP2])
line([WI1,OP1],[WI2,OP2])
line([WI1,PI1],[WI2,PI2])
line([WO1,OP1],[WO2,OP2])
line([WO1,PI1],[WO2,PI2])
line([OP1,PI1],[OP2,PI2])

% text(-0.8,-0.3,FIWO)
% text(0.3,-0.3,FIWI)
% text(-0.15,-0.2,FIOP)
% text(-0.6,0.3,WOPI)
% text(-0.4,0,WOOP)
% text(0.4,0.3,WIPI)
% text(0.2,0,WIOP)
% text(-0.2,0.2,OPPI)

title('Spectral Domain')
% legend('FIST','WAVE IN','WAVE OUT','OPEN','PINCH')
grid on
grid minor
%axis([-0.8 0.8 -0.8 0.8])

%% --------------------------------------------------------------------
[A B]=pca(G3,'NumComponents',2);

% NORMALIZATION OF THE TWO PRINCIPAL COMPONENTS (DIVIDE BY RANGES IN X AND Y:
% Col 1 is X, Col 2 is Y: ranges of both columns
Bx=B(:,1);
By=B(:,2);
Range_x=max(Bx)-min(Bx);
Range_y=max(By)-min(By);

Bx_norm = Bx/Range_x;
By_norm = By/Range_y;

B_norm = [Bx_norm By_norm];
B = B_norm;

% CENTROIDS:
F1=mean(B(1:25,1));
F2=mean(B(1:25,2));

WI1=mean(B(26:50,1));
WI2=mean(B(26:50,2));

WO1=mean(B(51:75,1));
WO2=mean(B(51:75,2));

OP1=mean(B(76:100,1));
OP2=mean(B(76:100,2));

PI1=mean(B(101:125,1));
PI2=mean(B(101:125,2));

SF1=std(B(1:25,1))
SF2=std(B(1:25,2))

SWI1=std(B(26:50,1))
SWI2=std(B(26:50,2))

SWO1=std(B(51:75,1))
SWO2=std(B(51:75,2))

SOP1=std(B(76:100,1))
SOP2=std(B(76:100,2))

SPI1=std(B(101:125,1))
SPI2=std(B(101:125,2))

FIWI=num2str(sqrt((F1-WI1)^2+(F2-WI2)^2),2)
FIWO=num2str(sqrt((F1-WO1)^2+(F2-WO2)^2),2)
FIOP=num2str(sqrt((F1-OP1)^2+(F2-OP2)^2),2)
FIPI=num2str(sqrt((F1-PI1)^2+(F2-PI2)^2),2)
WIWO=num2str(sqrt((WI1-WO1)^2+(WI2-WO2)^2),2)
WIOP=num2str(sqrt((WI1-OP1)^2+(WI2-OP2)^2),2)
WIPI=num2str(sqrt((WI1-PI1)^2+(WI2-PI2)^2),2)
WOOP=num2str(sqrt((WO1-OP1)^2+(WO2-OP2)^2),2)
WOPI=num2str(sqrt((WO1-PI1)^2+(WO2-PI2)^2),2)
OPPI=num2str(sqrt((OP1-PI1)^2+(OP2-PI2)^2),2)

subplot(1,3,3)
plot(B(1:25,1),B(1:25,2),'*r')
hold on
plot(B(26:50,1),B(26:50,2),'vm')
plot(B(51:75,1),B(51:75,2),'ob')
plot(B(76:100,1),B(76:100,2),'s')
plot(B(101:125,1),B(101:125,2),'d')

plot(F1,F2,'ok','LineWidth',3)

plot(WI1,WI2,'ok','LineWidth',3)
plot(WO1,WO2,'ok','LineWidth',3)
plot(OP1,OP2,'ok','LineWidth',3)
plot(PI1,PI2,'ok','LineWidth',3)

line([F1;WI1],[F2;WI2])
line([F1,WO1],[F2,WO2])
line([F1,OP1],[F2,OP2])
% line([F1,PI1],[F2,PI2])
% line([WI1,WO1],[WI2,WO2])
line([WI1,OP1],[WI2,OP2])
line([WI1,PI1],[WI2,PI2])
line([WO1,OP1],[WO2,OP2])
line([WO1,PI1],[WO2,PI2])
line([OP1,PI1],[OP2,PI2])

% text(0.3,0.3,FIWO)
% text(-0.85,0.2,FIWI)
% text(-0.15,0.25,FIOP)
% text(0.4,-0.3,WOPI)
% text(0.25,0.04,WOOP)
% text(-0.5,-0.33,WIPI)
% text(-0.5,-0.075,WIOP)
% text(-0.1,-0.17,OPPI)

title('Complexity Domain')

grid on
grid minor
%axis([-0.8 0.8 -0.8 0.8])
legend('FIST','WAVE IN','WAVE OUT','OPEN','PINCH')
sgtitle('Comparison Among Variables','Color','blue')