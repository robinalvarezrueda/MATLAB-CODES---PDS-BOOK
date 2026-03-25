function [g_p1,g_p2,g_p3,g_p4,g_p5,g_p6,g_p7,g_p8] = extraccion_senial_1(canal_1,canal_2,canal_3,canal_4,canal_5,canal_6,canal_7,canal_8,i)     
            
            gesto1=canal_1;
            gesto2=canal_2;
            gesto3=canal_3;
            gesto4=canal_4;
            gesto5=canal_5;
            gesto6=canal_6;
            gesto7=canal_7;
            gesto8=canal_8;
            t_vent=10;
            toler=1.2;
%-------------------------------------------------------------------------
% CANAL 1
            energia_promedio1=mean((abs(gesto1)).^2);
            g_p1=[]; %Acumulador
            H=1;
            while H<=length(gesto1)-t_vent
                v=gesto1(H:H+t_vent);    
                energia_vent1=mean((abs(v)).^2);    
                if (energia_vent1>toler*energia_promedio1)
                    g_p1=[g_p1;v];
                end
            H=H+10;
            end
%--------------------------------------------------------------------------
% CANAL 2
            energia_promedio_2=mean((abs(gesto2)).^2);
            g_p2=[]; %Acumulador
            H2=1;
            while H2<=length(gesto2)-t_vent
                ve=gesto2(H2:H2+t_vent);    
                energia_vent_2=mean((abs(ve)).^2);    
                if (energia_vent_2>toler*energia_promedio_2)
                    g_p2=[g_p2;ve];
                end
            H2=H2+10;
            end
%--------------------------------------------------------------------------
% CANAL 3
            energia_promedio_3=mean((abs(gesto3)).^2);
            g_p3=[]; %Acumulador
            H3=1;
            while H3<=length(gesto3)-t_vent
                ven=gesto3(H3:H3+t_vent);    
                energia_vent_3=mean((abs(ven)).^2);    
                if (energia_vent_3>2*toler*energia_promedio_3)
                    g_p3=[g_p3;ven];
                end
            H3=H3+10;
            end
%--------------------------------------------------------------------------
% CANAL 4
            energia_promedio_4=mean((abs(gesto4)).^2);
            g_p4=[]; %Acumulador
            H4=1;
            while H4<=length(gesto4)-t_vent
                vent=gesto4(H4:H4+t_vent);    
                energia_vent_4=mean((abs(vent)).^2);    
                if (energia_vent_4>1.5*toler*energia_promedio_4)
                    g_p4=[g_p4;vent];
                end
            H4=H4+10;
            end
%--------------------------------------------------------------------------
% CANAL 5
            energia_promedio_5=mean((abs(gesto5)).^2);
            g_p5=[]; %Acumulador
            H5=1;
            while H5<=length(gesto5)-t_vent
                venta=gesto5(H5:H5+t_vent);    
                energia_vent_5=mean((abs(venta)).^2);    
                if (energia_vent_5>toler*energia_promedio_5)
                    g_p5=[g_p5;venta];
                end
            H5=H5+10;
            end
%--------------------------------------------------------------------------
% CANAL 6
            energia_promedio_6=mean((abs(gesto6)).^2);
            g_p6=[]; %Acumulador
            H6=1;
            while H6<=length(gesto6)-t_vent
                ventan=gesto6(H6:H6+t_vent);    
                energia_vent_6=mean((abs(ventan)).^2);    
                if (energia_vent_6>toler*energia_promedio_6)
                    g_p6=[g_p6;ventan];
                end
            H6=H6+10;
            end    
%--------------------------------------------------------------------------
% CANAL 7
            energia_promedio_7=mean((abs(gesto7)).^2);
            g_p7=[]; %Acumulador
            H7=1;
            while H7<=length(gesto7)-t_vent
                ventana=gesto7(H7:H7+t_vent);    
                energia_vent_7=mean((abs(ventana)).^2);    
                if (energia_vent_7>toler*energia_promedio_7)
                    g_p7=[g_p7;ventana];
                end
            H7=H7+10;
            end   
%--------------------------------------------------------------------------
% CANAL 8
            energia_promedio_8=mean((abs(gesto8)).^2);
            g_p8=[]; %Acumulador
            H8=1;
            while H8<=length(gesto8)-t_vent
                ventanaa=gesto8(H8:H8+t_vent);    
                energia_vent_8=mean((abs(ventanaa)).^2);    
                if (energia_vent_8>toler*energia_promedio_8)
                    g_p8=[g_p8;ventanaa];
                end
            H8=H8+10;
            end
end

