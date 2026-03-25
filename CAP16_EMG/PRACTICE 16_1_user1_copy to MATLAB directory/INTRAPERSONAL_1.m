clc, clear all, close all

%% SELECCIÓN DE ALGORITMOS DE PREPROCESAMIENTO:

% EXTRACCION DE SENAL UTIL 
      % Si desea activarlo, solo descomente:
      extraccion = 1; % 'si';
      %extraccion = 2; %'no';

% IGUALACION DE MUESTRAS
      % Si desea activarlo, solo descomente:
      igualacion = 1; %'si';
      %igualacion = 2; %'no';

% RECTIFICACION
      % Si desea activarlo, solo descomente:
      rectificacion = 1; %'si';
      %rectificacion = 2; %'no';

% ENVOLVENTE
      % Si desea activarlo, solo descomente:
      %envolvente = 1; %'si';
      envolvente = 2; %'no';

% SUAVIZADO DE CURVAS  
      % Si desea activarlo, solo descomente:
      %suavizado = 1; %'si'; 
      suavizado = 2; %'no'; 

% Filtrado pasa altas (> 5 Hz): eliminación de toda componente inferior a 5 hz
      % Si desea activarlo, solo descomente el si y comente el no:
      %Filtrado_5 = 1; %'si';
      Filtrado_5 = 2; %'no';

% Filtrado pasa banda (5 Hz - 45 Hz): solo se permite el paso de componentes entre 5 y 45 Hz
      % Si desea activarlo, solo descomente:
      %Filtrado_5_45 = 1; %'si';
      Filtrado_5_45 = 2; %'no';

%% ----------------------------------------------------------------------
% Estabilidad del fenómeno - Variabilidad interpersonal

%------------------------'Analisis dominio tiempo'-----------------------

load('SENALES_EMG_USER_11cm.mat')

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    % EXTRACCION DE SENAL UTIL (RECONOCIMIENTO)
    if  extraccion == 1 %'si'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=extraccion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % IGUALACION DE MUESTRAS
     if  igualacion == 1 %'si'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=igualacion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICACION
    if  rectificacion == 1 %'si'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=rectificacion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=rectificacion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVOLVENTE
    if  envolvente == 1 %'si'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=envolvente_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end

    % SUAVIZADO DE CURVAS       
    if  suavizado == 1 % 'si'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=suavizado_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end
    
    % Filtrado pasa altas (> 5 Hz)
    if  Filtrado_5 == 1 %'si';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=filtrado_5_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Filtrado pasa banda (5 Hz - 45 Hz)
    if  Filtrado_5_45 == 1 %'si';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=filtrado_5_45_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

%% EXTRACCIÓN DE CARACTERÍSTICAS:  

% AREA BAJO LA CURVA
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(c1,c2,c3,c4,c5,c6,c7,c8);
            TOTALES_11cm(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

load('SENALES_EMG_USER_6cm.mat')

for i=1:1:25
       c1=EMG{i}(:,1);
       c2=EMG{i}(:,2);
       c3=EMG{i}(:,3);
       c4=EMG{i}(:,4);
       c5=EMG{i}(:,5);
       c6=EMG{i}(:,6);
       c7=EMG{i}(:,7);
       c8=EMG{i}(:,8);
            
    %% PREPROCESAMIENTO:

    % EXTRACCION DE SENAL UTIL (RECONOCIMIENTO)
    if  extraccion == 1 %'si'
        [gp1,gp2,gp3,gp4,gp5,gp6,gp7,gp8]=extraccion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gp1; c2=gp2; c3=gp3; c4=gp4; c5=gp5; c6=gp6; c7=gp7; c8=gp8;
    end

    % IGUALACION DE MUESTRAS
     if  igualacion == 1 %'si'
           [ges1,ges2,ges3,ges4,ges5,ges6,ges7,ges8]=igualacion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
           c1=ges1; c2=ges2; c3=ges3; c4=ges4; c5=ges5; c6=ges6; c7=ges7; c8=ges8;
     end

    % RECTIFICACION
    if  rectificacion == 1 %'si'
        %[c1,c2,c3,c4,c5,c6,c7,c8]=rectificacion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        [gest1,gest2,gest3,gest4,gest5,gest6,gest7,gest8]=rectificacion_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=gest1; c2=gest2; c3=gest3; c4=gest4; c5=gest5; c6=gest6; c7=gest7; c8=gest8;
    end

    % ENVOLVENTE
    if  envolvente == 1 %'si'
        [ba1,ba2,ba3,ba4,ba5,ba6,ba7,ba8]=envolvente_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=ba1; c2=ba2; c3=ba3; c4=ba4; c5=ba5; c6=ba6; c7=ba7; c8=ba8;
    end

    % SUAVIZADO DE CURVAS       
    if  suavizado == 1 % 'si'
        [Amean1,Amean2,Amean3,Amean4,Amean5,Amean6,Amean7,Amean8]=suavizado_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=Amean1; c2=Amean2; c3=Amean3; c4=Amean4; c5=Amean5; c6=Amean6; c7=Amean7; c8=Amean8;
    end

    % Filtrado pasa altas (> 5 Hz)
    if  Filtrado_5 == 1 %'si';
        [c1_filt_5,c2_filt_5,c3_filt_5,c4_filt_5,c5_filt_5,c6_filt_5,c7_filt_5,c8_filt_5]=filtrado_5_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
        c1=c1_filt_5; c2=c2_filt_5; c3=c3_filt_5; c4=c4_filt_5; c5=c5_filt_5; c6=c6_filt_5; c7=c7_filt_5; c8=c8_filt_5;
    end 
    
    % Filtrado pasa banda (5 Hz - 45 Hz)
    if  Filtrado_5_45 == 1 %'si';
      [c1_filt_5_45,c2_filt_5_45,c3_filt_5_45,c4_filt_5_45,c5_filt_5_45,c6_filt_5_45,c7_filt_5_45,c8_filt_5_45]=filtrado_5_45_senial_1(c1,c2,c3,c4,c5,c6,c7,c8);
      c1=c1_filt_5_45; c2=c2_filt_5_45; c3=c3_filt_5_45; c4=c4_filt_5_45; c5=c5_filt_5_45; c6=c6_filt_5_45; c7=c7_filt_5_45; c8=c8_filt_5_45;
    end 

%% EXTRACCIÓN DE CARACTERÍSTICAS:  
   
% AREA BAJO LA CURVA
            [total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8] = area_1(c1,c2,c3,c4,c5,c6,c7,c8);
            TOTALES_6cm(i,:)=[total_1,total_2,total_3,total_4,total_5,total_6,total_7,total_8];
end

% G1=TOTALES_11cm;
% G2=TOTALES_6cm;
% 
% % %--------------------------------------------------------------------------
% 
% [A B C D]=pca(G1,'NumComponents',2); % En B están la componentes principales
% 
% % NORMALIZACIÓN DE LAS DOS COMP. PRINCIPALES (DIVIDIR PARA RANGOS EN X E Y:
% %Col 1 es X, Col 2 es Y: rangos de ambas columnas
% Bx=B(:,1);
% By=B(:,2);
% Rango_x=max(Bx)-min(Bx);
% Rango_y=max(By)-min(By);
% 
% Bx_norm = Bx/Rango_x;
% By_norm = By/Rango_y;
% 
% B_norm = [Bx_norm By_norm];
% B = B_norm;
% 
% % CENTROS DE MASA:
% F1=mean(B(1:25,1)); % Valor medio de la CP1 de G1 (11 cm) 
% F2=mean(B(1:25,2)); % Valor medio de la CP2 de G1 (6 cm) 
% 
% WI1=mean(B(26:50,1)); % Valor medio de la CP1 de G1 (dom tiempo)(Wave In) 
% WI2=mean(B(26:50,2)); % Valor medio de la CP2 de G1 (dom tiempo)(Wave In)
% 
% WO1=mean(B(51:75,1)); % Valor medio de la CP1 de G1 (dom tiempo)(Wave Out)
% WO2=mean(B(51:75,2)); % Valor medio de la CP2 de G1 (dom tiempo)(Wave Out)
% 
% OP1=mean(B(76:100,1));% Valor medio de la CP1 de G1 (dom tiempo)(Open)
% OP2=mean(B(76:100,2));% Valor medio de la CP2 de G1 (dom tiempo)(Open)
% 
% PI1=mean(B(101:125,1));% Valor medio de la CP1 de G1 (dom tiempo)(Pinch)
% PI2=mean(B(101:125,2));% Valor medio de la CP2 de G1 (dom tiempo)(Pinch)
% 
% % DISPERSIONES:
% SF1=std(B(1:25,1)); % Desv. Est. de la CP1 de G1 (dom tiempo)(Fist) 
% SF2=std(B(1:25,2)); % Desv. Est. de la CP2 de G1 (dom tiempo)(Fist) 
% 
% SWI1=std(B(26:50,1)); % Desv. Est. de la CP1 de G1 (dom tiempo)(Wave In) 
% SWI2=std(B(26:50,2)); % Desv. Est. de la CP1 de G1 (dom tiempo)(Wave In) 
% 
% SWO1=std(B(51:75,1)); % Desv. Est. de la CP1 de G1 (dom tiempo)(Wave Out) 
% SWO2=std(B(51:75,2)); % Desv. Est. de la CP2 de G1 (dom tiempo)(Wave Out) 
% 
% SOP1=std(B(76:100,1)); % Desv. Est. de la CP1 de G1 (dom tiempo)(Open) 
% SOP2=std(B(76:100,2)); % Desv. Est. de la CP2 de G1 (dom tiempo)(Open) 
% 
% SPI1=std(B(101:125,1)); % Desv. Est. de la CP1 de G1 (dom tiempo)(Pinch) 
% SPI2=std(B(101:125,2)); % Desv. Est. de la CP2 de G1 (dom tiempo)(Pinch) 
% 
% % DISTANCIAS ENTRE CENTROIDES:
% FIWI=num2str(sqrt((F1-WI1)^2+(F2-WI2)^2),2);
% FIWO=num2str(sqrt((F1-WO1)^2+(F2-WO2)^2),2);
% FIOP=num2str(sqrt((F1-OP1)^2+(F2-OP2)^2),2);
% FIPI=num2str(sqrt((F1-PI1)^2+(F2-PI2)^2),2);
% WIWO=num2str(sqrt((WI1-WO1)^2+(WI2-WO2)^2),2);
% WIOP=num2str(sqrt((WI1-OP1)^2+(WI2-OP2)^2),2);
% WIPI=num2str(sqrt((WI1-PI1)^2+(WI2-PI2)^2),2);
% WOOP=num2str(sqrt((WO1-OP1)^2+(WO2-OP2)^2),2);
% WOPI=num2str(sqrt((WO1-PI1)^2+(WO2-PI2)^2),2);
% OPPI=num2str(sqrt((OP1-PI1)^2+(OP2-PI2)^2),2);
% 
% % GRÁFICAS:
% figure(1)
% subplot(1,3,1)
% plot(B(1:25,1),B(1:25,2),'*r')
% hold on
% plot(B(26:50,1),B(26:50,2),'vm')
% plot(B(51:75,1),B(51:75,2),'ob')
% plot(B(76:100,1),B(76:100,2),'s')
% plot(B(101:125,1),B(101:125,2),'d')
% 
% plot(F1,F2,'ok','LineWidth',3)
% plot(WI1,WI2,'ok','LineWidth',3)
% plot(WO1,WO2,'ok','LineWidth',3)
% plot(OP1,OP2,'ok','LineWidth',3)
% plot(PI1,PI2,'ok','LineWidth',3)
% 
% line([F1;WI1],[F2;WI2])
% line([F1,WO1],[F2,WO2])
% line([F1,OP1],[F2,OP2])
% line([WI1,OP1],[WI2,OP2])
% line([WI1,PI1],[WI2,PI2])
% line([WO1,OP1],[WO2,OP2])
% line([WO1,PI1],[WO2,PI2])
% line([OP1,PI1],[OP2,PI2])
% 
% % text(-0.5,0.3,FIWO)
% % text(0.5,0.3,FIWI)
% % text(0,0.25,FIOP)
% % text(-0.5,0.02,WOOP)
% % text(-0.8,-0.2,WOPI)
% % text(0.2,-0.3,WIPI)
% % text(0.2,-0.05,WIOP)
% % text(-0.20,-0.17,OPPI)
% 
% % legend('FIST','WAVE IN','WAVE OUT','OPEN','PINCH')
% title('Dominio Temporal')
% grid on
% grid minor
% %axis([-0.8 0.8 -0.8 0.8])
% 
% clear F1 F2 WI1 WI2 WO1 WO2 OP1 OP2 PI1 PI2 FIWI FIWO FIOP FIPI WIWO WIOP WIPI WOOP WOPI OPPI
% 
% %% --------------------------------------------------------------------
% 
% [A B C D]=pca(G2,'NumComponents',2);
% 
% % NORMALIZACIÓN DE LAS DOS COMP. PRINCIPALES (DIVIDIR PARA RANGOS EN X E Y:
% %Col 1 es X, Col 2 es Y: rangos de ambas columnas
% Bx=B(:,1);
% By=B(:,2);
% Rango_x=max(Bx)-min(Bx);
% Rango_y=max(By)-min(By);
% 
% Bx_norm = Bx/Rango_x;
% By_norm = By/Rango_y;
% 
% B_norm = [Bx_norm By_norm];
% B = B_norm;
% 
% % CENTROIDES:
% F1=mean(B(1:25,1));
% F2=mean(B(1:25,2));
% 
% WI1=mean(B(26:50,1));
% WI2=mean(B(26:50,2));
% 
% WO1=mean(B(51:75,1));
% WO2=mean(B(51:75,2));
% 
% OP1=mean(B(76:100,1));
% OP2=mean(B(76:100,2));
% 
% PI1=mean(B(101:125,1));
% PI2=mean(B(101:125,2));
% 
% SF1=std(B(1:25,1))
% SF2=std(B(1:25,2))
% 
% SWI1=std(B(26:50,1))
% SWI2=std(B(26:50,2))
% 
% SWO1=std(B(51:75,1))
% SWO2=std(B(51:75,2))
% 
% SOP1=std(B(76:100,1))
% SOP2=std(B(76:100,2))
% 
% SPI1=std(B(101:125,1))
% SPI2=std(B(101:125,2))
% 
% FIWI=num2str(sqrt((F1-WI1)^2+(F2-WI2)^2),2)
% FIWO=num2str(sqrt((F1-WO1)^2+(F2-WO2)^2),2)
% FIOP=num2str(sqrt((F1-OP1)^2+(F2-OP2)^2),2)
% FIPI=num2str(sqrt((F1-PI1)^2+(F2-PI2)^2),2)
% WIWO=num2str(sqrt((WI1-WO1)^2+(WI2-WO2)^2),2)
% WIOP=num2str(sqrt((WI1-OP1)^2+(WI2-OP2)^2),2)
% WIPI=num2str(sqrt((WI1-PI1)^2+(WI2-PI2)^2),2)
% WOOP=num2str(sqrt((WO1-OP1)^2+(WO2-OP2)^2),2)
% WOPI=num2str(sqrt((WO1-PI1)^2+(WO2-PI2)^2),2)
% OPPI=num2str(sqrt((OP1-PI1)^2+(OP2-PI2)^2),2)
% 
% subplot(1,3,2)
% plot(B(1:25,1),B(1:25,2),'*r')
% hold on
% plot(B(26:50,1),B(26:50,2),'vm')
% plot(B(51:75,1),B(51:75,2),'ob')
% plot(B(76:100,1),B(76:100,2),'s')
% plot(B(101:125,1),B(101:125,2),'d')
% 
% 
% plot(F1,F2,'ok','LineWidth',3)
% 
% plot(WI1,WI2,'ok','LineWidth',3)
% plot(WO1,WO2,'ok','LineWidth',3)
% plot(OP1,OP2,'ok','LineWidth',3)
% plot(PI1,PI2,'ok','LineWidth',3)
% 
% line([F1;WI1],[F2;WI2])
% line([F1,WO1],[F2,WO2])
% line([F1,OP1],[F2,OP2])
% line([WI1,OP1],[WI2,OP2])
% line([WI1,PI1],[WI2,PI2])
% line([WO1,OP1],[WO2,OP2])
% line([WO1,PI1],[WO2,PI2])
% line([OP1,PI1],[OP2,PI2])
% 
% % text(-0.8,-0.3,FIWO)
% % text(0.3,-0.3,FIWI)
% % text(-0.15,-0.2,FIOP)
% % text(-0.6,0.3,WOPI)
% % text(-0.4,0,WOOP)
% % text(0.4,0.3,WIPI)
% % text(0.2,0,WIOP)
% % text(-0.2,0.2,OPPI)
% 
% title('Dominio Espectral')
% % legend('FIST','WAVE IN','WAVE OUT','OPEN','PINCH')
% grid on
% grid minor
% %axis([-0.8 0.8 -0.8 0.8])
% 
% %% --------------------------------------------------------------------
% [A B]=pca(G3,'NumComponents',2);
% 
% % NORMALIZACIÓN DE LAS DOS COMP. PRINCIPALES (DIVIDIR PARA RANGOS EN X E Y:
% %Col 1 es X, Col 2 es Y: rangos de ambas columnas
% Bx=B(:,1);
% By=B(:,2);
% Rango_x=max(Bx)-min(Bx);
% Rango_y=max(By)-min(By);
% 
% Bx_norm = Bx/Rango_x;
% By_norm = By/Rango_y;
% 
% B_norm = [Bx_norm By_norm];
% B = B_norm;
% 
% % CENTROIDES:
% F1=mean(B(1:25,1));
% F2=mean(B(1:25,2));
% 
% WI1=mean(B(26:50,1));
% WI2=mean(B(26:50,2));
% 
% WO1=mean(B(51:75,1));
% WO2=mean(B(51:75,2));
% 
% OP1=mean(B(76:100,1));
% OP2=mean(B(76:100,2));
% 
% PI1=mean(B(101:125,1));
% PI2=mean(B(101:125,2));
% 
% SF1=std(B(1:25,1))
% SF2=std(B(1:25,2))
% 
% SWI1=std(B(26:50,1))
% SWI2=std(B(26:50,2))
% 
% SWO1=std(B(51:75,1))
% SWO2=std(B(51:75,2))
% 
% SOP1=std(B(76:100,1))
% SOP2=std(B(76:100,2))
% 
% SPI1=std(B(101:125,1))
% SPI2=std(B(101:125,2))
% 
% FIWI=num2str(sqrt((F1-WI1)^2+(F2-WI2)^2),2)
% FIWO=num2str(sqrt((F1-WO1)^2+(F2-WO2)^2),2)
% FIOP=num2str(sqrt((F1-OP1)^2+(F2-OP2)^2),2)
% FIPI=num2str(sqrt((F1-PI1)^2+(F2-PI2)^2),2)
% WIWO=num2str(sqrt((WI1-WO1)^2+(WI2-WO2)^2),2)
% WIOP=num2str(sqrt((WI1-OP1)^2+(WI2-OP2)^2),2)
% WIPI=num2str(sqrt((WI1-PI1)^2+(WI2-PI2)^2),2)
% WOOP=num2str(sqrt((WO1-OP1)^2+(WO2-OP2)^2),2)
% WOPI=num2str(sqrt((WO1-PI1)^2+(WO2-PI2)^2),2)
% OPPI=num2str(sqrt((OP1-PI1)^2+(OP2-PI2)^2),2)
% 
% subplot(1,3,3)
% plot(B(1:25,1),B(1:25,2),'*r')
% hold on
% plot(B(26:50,1),B(26:50,2),'vm')
% plot(B(51:75,1),B(51:75,2),'ob')
% plot(B(76:100,1),B(76:100,2),'s')
% plot(B(101:125,1),B(101:125,2),'d')
% 
% plot(F1,F2,'ok','LineWidth',3)
% 
% plot(WI1,WI2,'ok','LineWidth',3)
% plot(WO1,WO2,'ok','LineWidth',3)
% plot(OP1,OP2,'ok','LineWidth',3)
% plot(PI1,PI2,'ok','LineWidth',3)
% 
% 
% line([F1;WI1],[F2;WI2])
% line([F1,WO1],[F2,WO2])
% line([F1,OP1],[F2,OP2])
% % line([F1,PI1],[F2,PI2])
% % line([WI1,WO1],[WI2,WO2])
% line([WI1,OP1],[WI2,OP2])
% line([WI1,PI1],[WI2,PI2])
% line([WO1,OP1],[WO2,OP2])
% line([WO1,PI1],[WO2,PI2])
% line([OP1,PI1],[OP2,PI2])
% 
% % text(0.3,0.3,FIWO)
% % text(-0.85,0.2,FIWI)
% % text(-0.15,0.25,FIOP)
% % text(0.4,-0.3,WOPI)
% % text(0.25,0.04,WOOP)
% % text(-0.5,-0.33,WIPI)
% % text(-0.5,-0.075,WIOP)
% % text(-0.1,-0.17,OPPI)
% 
% title('Dominio de la Complejidad')
% 
% grid on
% grid minor
% %axis([-0.8 0.8 -0.8 0.8])
% legend('FIST','WAVE IN','WAVE OUT','OPEN','PINCH')
% sgtitle('Comparación entre Variables','Color','blue')


% G1=carga50;
% G2=carga100;

G1=TOTALES_11cm;
G2=TOTALES_6cm;

[A B C D]=pca(G1,'NumComponents',2);

F1=round(mean(B(1:25,1)));
F2=round(mean(B(1:25,2)));

WI1=round(mean(B(26:50,1)));
WI2=round(mean(B(26:50,2)));

WO1=round(mean(B(51:75,1)));
WO2=round(mean(B(51:75,2)));

OP1=round(mean(B(76:100,1)));
OP2=round(mean(B(76:100,2)));

PI1=round(mean(B(101:125,1)));
PI2=round(mean(B(101:125,2)));

FIWI=int2str(sqrt((F1-WI1)^2+(F2-WI2)^2))
FIWO=int2str(sqrt((F1-WO1)^2+(F2-WO2)^2))
FIOP=int2str(sqrt((F1-OP1)^2+(F2-OP2)^2))
FIPI=int2str(sqrt((F1-PI1)^2+(F2-PI2)^2))
WIWO=int2str(sqrt((WI1-WO1)^2+(WI2-WO2)^2))
WIOP=int2str(sqrt((WI1-OP1)^2+(WI2-OP2)^2))
WIPI=int2str(sqrt((WI1-PI1)^2+(WI2-PI2)^2))
WOOP=int2str(sqrt((WO1-OP1)^2+(WO2-OP2)^2))
WOPI=int2str(sqrt((WO1-PI1)^2+(WO2-PI2)^2))
OPPI=int2str(sqrt((OP1-PI1)^2+(OP2-PI2)^2))

figure(1)
subplot(1,2,1)
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

text(-45,52,FIWO)
text(55,30,FIWI)
text(-5,30,FIOP)
text(-65,-30,WOPI)
text(-45,5,WOOP)
text(25,-45,WIPI)
text(35,-10,WIOP)
text(-20,-25,OPPI)


title('Distancia = 6 [cm]')

% legend('FIST','WAVE IN','WAVE OUT','OPEN','PINCH')
grid on
grid minor
axis([-130 130 -110 100])

[A B C D]=pca(G2,'NumComponents',2);

F1=round(mean(B(1:25,1)));
F2=round(mean(B(1:25,2)));

WI1=round(mean(B(26:50,1)));
WI2=round(mean(B(26:50,2)));

WO1=round(mean(B(51:75,1)));
WO2=round(mean(B(51:75,2)));

OP1=round(mean(B(76:100,1)));
OP2=round(mean(B(76:100,2)));

PI1=round(mean(B(101:125,1)));
PI2=round(mean(B(101:125,2)));

FIWI=int2str(sqrt((F1-WI1)^2+(F2-WI2)^2));
FIWO=int2str(sqrt((F1-WO1)^2+(F2-WO2)^2));
FIOP=int2str(sqrt((F1-OP1)^2+(F2-OP2)^2));
WIOP=int2str(sqrt((WI1-OP1)^2+(WI2-OP2)^2));
WIPI=int2str(sqrt((WI1-PI1)^2+(WI2-PI2)^2));
WOOP=int2str(sqrt((WO1-OP1)^2+(WO2-OP2)^2));
WOPI=int2str(sqrt((WO1-PI1)^2+(WO2-PI2)^2));
OPPI=int2str(sqrt((OP1-PI1)^2+(OP2-PI2)^2));

subplot(1,2,2)
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

text(-20,47,FIWO)
text(57,-15,FIWI)
text(20,25,FIOP)
text(-73,0,WOPI)
text(-45,30,WOOP)
text(-13,-55,WIPI)
text(0,-5,WIOP)
text(-30,-10,OPPI)

title('Distancia = 11 [cm]')
legend('FIST','WAVE IN','WAVE OUT','OPEN','PINCH')
grid on
grid minor
axis([-130 130 -110 100])

sgtitle('Distancia de Colocación Myo-armband','Color','blue')