function [KFD1,KFD2,KFD3,KFD4,KFD5,KFD6,KFD7,KFD8]=Katz_FD(serie1,serie2,serie3,serie4,serie5,serie6,serie7,serie8)
%canal 1 
L1 = 0;
N1 = length(serie1);
n1 = N1 - 1; %(N) en la formula explicado el la teoria
for i1 = 1:(N1 - 1)  % sumatoria de las distancias euclidianas entre los
                     % puntos de la serie temporal (L)
    aux1 = sqrt(1 + ((serie1(i1) - serie1(i1+1))^2)); % calculo de la distancia
                                              % euclidiana entre dos puntos
    L1 = L1 + aux1; % (L) en la formula explicado el la teoria
    clear('aux1');
end
dist1 = NaN(1,N1-1); %si aparece un valor NaN en este vector, simplemente se ignora 
                     %para luego hallar el valor maximo del vector en el sigueinte paso
for i1 = 2:N1
    dist1(i1) = sqrt(((1 - i1)^2) + ((serie1(1) - serie1(i1))^2));
end
d1 = max(dist1); % en la formula explicado el la teoria
KFD1 = log10(n1)/(log10(n1) + log10(d1/L1)); % formula de dimension fractal de Katz
%--------------------------------------------------------------------------
%canal 2   -> se aplica lo mismo antes explicado para cada canal
L2 = 0;
N2 = length(serie2);
n2 = N2 - 1; 
for i2 = 1:(N2 - 1)
    aux2 = sqrt(1 + ((serie2(i2) - serie2(i2+1))^2));
    L2 = L2 + aux2;
    clear('aux2');
end
dist2 = NaN(1,N2-1);
for i2 = 2:N2
    dist2(i2) = sqrt(((1 - i2)^2) + ((serie2(1) - serie2(i2))^2));
end
d2 = max(dist2);
KFD2 = log10(n2)/(log10(n2) + log10(d2/L2));
%--------------------------------------------------------------------------
%canal 3
L3 = 0;
N3 = length(serie3);
n3 = N3 - 1; 
for i3 = 1:(N3 - 1)
    aux3 = sqrt(1 + ((serie3(i3) - serie3(i3+1))^2));
    L3 = L3 + aux3;
    clear('aux3');
end
dist3 = NaN(1,N3-1);
for i3 = 2:N3
    dist3(i3) = sqrt(((1 - i3)^2) + ((serie3(1) - serie3(i3))^2));
end
d3 = max(dist3);
KFD3 = log10(n3)/(log10(n3) + log10(d3/L3));
%--------------------------------------------------------------------------
%canal 4
L4 = 0;
N4 = length(serie4);
n4 = N4 - 1; 
for i4 = 1:(N4 - 1)
    aux4 = sqrt(1 + ((serie4(i4) - serie4(i4+1))^2));
    L4 = L4 + aux4;
    clear('aux4');
end
dist4 = NaN(1,N4-1);
for i4 = 2:N4
    dist4(i4) = sqrt(((1 - i4)^2) + ((serie4(1) - serie4(i4))^2));
end
d4 = max(dist4);
KFD4 = log10(n4)/(log10(n4) + log10(d4/L4));
%--------------------------------------------------------------------------
%canal 5
L5 = 0;
N5 = length(serie5);
n5 = N5 - 1; 
for i5 = 1:(N5 - 1)
    aux5 = sqrt(1 + ((serie5(i5) - serie5(i5+1))^2));
    L5 = L5 + aux5;
    clear('aux5');
end
dist5 = NaN(1,N5-1);
for i5 = 2:N5
    dist5(i5) = sqrt(((1 - i5)^2) + ((serie5(1) - serie5(i5))^2));
end
d5 = max(dist5);
KFD5 = log10(n5)/(log10(n5) + log10(d5/L5));
%--------------------------------------------------------------------------
%canal 6
L6 = 0;
N6 = length(serie6);
n6 = N6 - 1; 
for i6 = 1:(N6 - 1)
    aux6 = sqrt(1 + ((serie6(i6) - serie6(i6+1))^2));
    L6 = L6 + aux6;
    clear('aux6');
end
dist6 = NaN(1,N6-1);
for i6 = 2:N6
    dist6(i6) = sqrt(((1 - i6)^2) + ((serie6(1) - serie6(i6))^2));
end
d6 = max(dist6);
KFD6 = log10(n6)/(log10(n6) + log10(d6/L6));
%--------------------------------------------------------------------------
%canal 7
L7 = 0;
N7 = length(serie7);
n7 = N7 - 1; 
for i7 = 1:(N7 - 1)
    aux7 = sqrt(1 + ((serie7(i7) - serie7(i7+1))^2));
    L7 = L7 + aux7;
    clear('aux7');
end
dist7 = NaN(1,N7-1);
for i7 = 2:N7
    dist7(i7) = sqrt(((1 - i7)^2) + ((serie7(1) - serie7(i7))^2));
end
d7 = max(dist7);
KFD7 = log10(n7)/(log10(n7) + log10(d7/L7));
%--------------------------------------------------------------------------
%canal 8
L8 = 0;
N8 = length(serie8);
n8 = N8 - 1; 
for i8 = 1:(N8 - 1)
    aux8 = sqrt(1 + ((serie8(i8) - serie8(i8+1))^2));
    L8 = L8 + aux8;
    clear('aux8');
end
dist8 = NaN(1,N8-1);
for i8 = 2:N8
    dist8(i8) = sqrt(((1 - i8)^2) + ((serie8(1) - serie8(i8))^2));
end
d8 = max(dist8);
KFD8 = log10(n8)/(log10(n8) + log10(d8/L8));
%--------------------------------------------------------------------------
end