function [w]=my_triangular(n)
%Funcion que me permite generar la ventana
for (k=1:1:n)
    r= rem(n,2); % para saber si es número par o impar de muestras
    %En el caso de que k tome un valor impar de n
    if(r==1)
        if((k>=1)&(k<=((n+1)/2)))
            w(k)=(2*k)/(n+1);
        elseif((k>((n+1)/2))&(k<=n))
            w(k)=(2*(n-k+1))/(n+1);
        end
    %En el caso de que k tome un valor par de n
    elseif(r==0)    
        if((k>=1)&(k<=n/2))
            w(k)=(2*k-1)/n;
        elseif((k>=((n/2)+1))&(k<=n))
            w(k)=(2*(n-k)+1)/n;
        end
    end
    k=k+1;    
end  
w=w';
