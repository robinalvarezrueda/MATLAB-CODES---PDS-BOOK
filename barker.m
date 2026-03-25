function sec=barker(longitud)
if longitud==1
    sec=1;
elseif longitud==2
    sec=[-1 1];
elseif longitud==3
    sec=[-1 -1 1];
elseif longitud==4
    sec=[-1 -1 1 -1];
elseif longitud==5
    sec=[-1 -1 -1 1 -1];
elseif longitud==7
    sec=[-1 -1 -1 1 1 -1 1];
elseif longitud==11
    sec=[-1 -1 -1 1 1 1 -1 1 1 -1 1];
elseif longitud==13
    sec=[-1 -1 -1 -1 -1 1 1 -1 -1 1 -1 1 -1];
else
    disp('Ingrese una longitud de 1,2,3,4,5,7,11,13')
end
