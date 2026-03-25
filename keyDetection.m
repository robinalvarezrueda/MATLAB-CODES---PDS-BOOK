function key = keyDetection(peaks)
% KEYDETECTION receives the frequency peaks and detects the pressed key
% Number of peaks
NF = 2;
tolerance = 5;
lower_freq = min(peaks);
upper_freq = max(peaks);

for i = 1:NF
   
    if lower_freq >= 697-tolerance && lower_freq <= 697+tolerance

        if upper_freq >= 1209-tolerance && upper_freq <= 1209+tolerance
            key = '1';
        end
        
        if upper_freq >= 1336-tolerance && upper_freq <= 1336+tolerance
            key = '2';
        end
        if upper_freq >= 1477-tolerance && upper_freq <= 1477+tolerance
            key = '3';
        end
        
        if upper_freq >= 1633-tolerance && upper_freq <= 1633+tolerance
            key = 'A';
        end
        
    elseif lower_freq >= 770-tolerance && lower_freq <= 770+tolerance
        
        if upper_freq >= 1209-tolerance && upper_freq <= 1209+tolerance
            key = '4';
        end
        
        if upper_freq >= 1336-tolerance && upper_freq <= 1336+tolerance
            key = '5';
        end
        
        if upper_freq >= 1477-tolerance && upper_freq <= 1477+tolerance
            key = '6';
        end
        
        if upper_freq >= 1633-tolerance && upper_freq <= 1633+tolerance
            key = 'B';
        end
        
    elseif lower_freq >= 852-tolerance && lower_freq <= 852+tolerance
        
        if upper_freq >= 1209-tolerance && upper_freq <= 1209+tolerance
            key = '7';
        end
        
        if upper_freq >= 1336-tolerance && upper_freq <= 1336+tolerance
            key = '8';
        end
        
        if upper_freq >= 1477-tolerance && upper_freq <= 1477+tolerance
            key = '9';
        end
        
        if upper_freq >= 1633-tolerance && upper_freq <= 1633+tolerance
            key = 'C';
        end
        
    elseif lower_freq >= 941-tolerance && lower_freq <= 941+tolerance
        
        if upper_freq >= 1209-tolerance && upper_freq <= 1209+tolerance
            key = '*';
        end
        
        if upper_freq >= 1336-tolerance && upper_freq <= 1336+tolerance
            key = '0';
        end
        
        if upper_freq >= 1477-tolerance && upper_freq <= 1477+tolerance
            key = '#';
        end
        
        if upper_freq >= 1633-tolerance && upper_freq <= 1633+tolerance
            key = 'D';
        end
    else
        key = 0;
    end
end
end
