%% PRACTICE 5.3. Implementation of a custom downsampling function.

% Creation of function mydownsample 
function y_downsample = my_downsample(senial, factor)
    i = 1;
    for n = 1:factor:length(senial)
        y_downsamplef(i) = senial(n);  
        i = i + 1;
    end
    y_downsample = y_downsamplef';
end
