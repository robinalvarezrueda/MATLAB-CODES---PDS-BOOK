function [g_p1,g_p2,g_p3,g_p4,g_p5,g_p6,g_p7,g_p8] = signal_extraction_1(c1,c2,c3,c4,c5,c6,c7,c8)     
            
  gesture1=c1; gesture2=c2; gesture3=c3; gesture4=c4; gesture5=c5; gesture6=c6; gesture7=c7; gesture8=c8;
  window_length=10;
  tolerance=1.2;
%-------------------------------------------------------------------------
% CHANNEL 1
            average_energy1=mean((abs(gesture1)).^2);
            g_p1=[]; %Accumulator
            H=1;
            while H<=length(gesture1)-window_length
                v=gesture1(H:H+window_length);    
                window_energy1=mean((abs(v)).^2);    
                if (window_energy1>tolerance*average_energy1)
                    g_p1=[g_p1;v];
                end
            H=H+10;
            end
%--------------------------------------------------------------------------
…
%--------------------------------------------------------------------------
% CHANNEL 8
            average_energy_8=mean((abs(gesture8)).^2);
            g_p8=[]; %Accumulator
            H8=1;
            while H8<=length(gesture8)-window_length
                window_segment=gesture8(H8:H8+window_length);    
                window_energy_8=mean((abs(window_segment)).^2);    
                if (window_energy_8>tolerance*average_energy_8)
                    g_p8=[g_p8;window_segment];
                end
            H8=H8+10;
            end
end
