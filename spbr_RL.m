close all % close existing figures
clc
open_system('FBR')
out = sim('FBR');
hf = figure('units','normalized','outerposition',[0 0 1 1]);
hf.Color = 'w';



D1 = plot([4 5 4.5 4 4.5 5 4 5 4.5 4.5],[0 0 0 -1 0 -1 -1 -1 0 1],'k', [4.5 4.5],[-1 -2],'k');
text(-1,-0.25,'D1');
hold on
D2 = plot([0 1 0.5 0 0.5 1 0 1 0.5 0.5],[0 0 0 -1 0 -1 -1 -1 0 1],'k', [0.5 0.5],[-1 -2],'k');
text(3,-0.25,'D2');
hold on
D3 = plot([0 1 0.5 0 0.5 1 0 1 0.5 0.5],[-5 -5 -5 -6 -5 -6 -6 -6 -5 -4],'k', [0.5 0.5],[-6 -7],'k');
text(-1,-5.5,'D3');
hold on
D4 = plot([4 5 4.5 4 4.5 5 4 5 4.5 4.5],[-5 -5 -5 -6 -5 -6 -6 -6 -5 -4],'k', [4.5 4.5],[-6 -7],'k');
text(3,-5.5,'D4');
hold on
L1 = plot([0.5 0.5],[-2 -3],'k');
L2 = plot([0.5 0.5],[-3 -4],'k');

L3 = plot([4.5 4.5],[-2 -3],'k');
L4 = plot([4.5 4.5],[-3 -4],'k');

L5 = plot([0.5 4.5],[1 1],'k',[0.5 4.5],[-7 -7],'k');
L6 = plot([4.5 6.5],[1 1],'k',[4.5 6.5],[-7 -7],'k');
set(L6,'Color','k');

p = nsidedpoly(1000, 'Center', [2.5 -3], 'Radius', 0.5);
hold on
AC = plot(p,'FaceColor', 'w','EdgeColor','k');
text(2.2,-3,'Vac','FontSize',8);
text(1.75,-4,'v_m sin(\omegat)','FontSize',8);
a = text(1.5,-2.5,'+','FontSize',14);
b = text(3.5,-2.5,'-','FontSize',14);


LAC1 = plot([0.5 2],[-3 -3],'k');
LAC2 = plot([3 4.5],[-3 -3],'k');

x1=[6.5	6.5	6.27	6.75	6.29	6.77	6.28	6.77	6.51	6.52	6.61	6.7	6.74	6.73	6.66	6.59	6.51	6.42	6.33	6.28	6.34	6.43	6.51	6.69	6.73	6.74	6.72	6.67	6.63	6.54	6.46	6.37	6.29	6.37	6.44	6.51	6.67	6.72	6.75	6.74	6.71	6.65	6.58	6.5	6.42	6.36	6.29	6.35	6.42	6.5	6.57	6.71	6.73	6.74	6.73	6.69	6.63	6.56	6.5	6.5];
y1=[1.0	-0.18	-0.32	-0.59	-0.87	-1.15	-1.41	-1.69	-1.82	-2.95	-2.99	-3.07	-3.17	-3.32	-3.42	-3.45	-3.49	-3.51	-3.49	-3.45	-3.38	-3.39	-3.39	-3.51	-3.59	-3.69	-3.78	-3.85	-3.9	-3.93	-3.95	-3.97	-3.89	-3.83	-3.82	-3.85	-3.94	-3.99	-4.07	-4.18	-4.27	-4.33	-4.38	-4.4	-4.41	-4.4	-4.35	-4.29	-4.28	-4.28	-4.3	-4.41	-4.49	-4.57	-4.68	-4.73	-4.79	-4.84	-4.85	-7];
res=plot(x1,y1,'k');
set(res,'LineWidth',2);
text(6,0,'+','FontSize',14);
text(6,-5,'-','FontSize',14);

set(D1,'LineWidth',2);
set(D1,'Color','r');
set(D2,'LineWidth',2);
set(D3,'LineWidth',2);
set(D4,'LineWidth',2);
set(D4,'Color','r');

set(L1,'LineWidth',2);
set(L2,'LineWidth',2);

set(L3,'LineWidth',2);
set(L4,'LineWidth',2);

set(L5,'LineWidth',2);
set(L6,'LineWidth',2);

set(AC,'LineWidth',2);
set(LAC1,'LineWidth',2);
set(LAC2,'LineWidth',2);
set(LAC1,'Color','k');
set(LAC2,'Color','k');


%Voltage X axis variables
xsource = linspace(-12,-3.5,800);
xload = linspace(-12,-3.5,800);
xvd1 = linspace(-12,-3.5,800);
xvd2 = linspace(-12,-3.5,800);

%Current X axis variables
xisource = linspace(9,17,800);
xiload = linspace(9,17,800);
xid1 = linspace(9,17,800);
xid2 = linspace(9,17,800);

time    = squeeze(out.Vload.Time);
vload   = squeeze(out.Vload.Data)./(230*sqrt(2));
vload=vload-4;
vsource = squeeze(out.Vsource.Data)./(230*sqrt(2));
mvd1 = -1*min(squeeze(out.VD1.Data));
vd1 = squeeze(out.VD1.Data)./mvd1;
vd1=vd1-6;
mvd2 = -1*min(squeeze(out.VD2.Data));
vd2 = squeeze(out.VD2.Data)./mvd2;
vd2=vd2-9;

mload = max(squeeze(out.Iload.Data));
iload   = squeeze(out.Iload.Data)./mload;
iload=iload-4;
msource = max(squeeze(out.Isource.Data));
isource = squeeze(out.Isource.Data)./msource;
mid1 = max(squeeze(out.ID1.Data));
id1 = squeeze(out.ID1.Data)./mid1;
id1=id1-7;
mid2 = max(squeeze(out.ID2.Data));
id2 = squeeze(out.ID2.Data)./mid2;
id2=id2-10;


nt = numel(time);

%Plot for Left Side 
hold on
hvs = plot(xsource,vsource(1:800),'Color','r','LineWidth',3);
hold on
hvl = plot(xload,vload(1:800),'Color','b','LineWidth',3);
hold on
hvd1 = plot(xvd1,vd1(1:800),'Color','m','LineWidth',3);
hold on
hvd2 = plot(xvd2,vd2(1:800),'Color',[0.8500 0.3250 0.0980],'LineWidth',3);

%Plot for Right Side 
hold on
his = plot(xisource,isource(1:800),'Color','r','LineWidth',3);
hold on
hil = plot(xiload,iload(1:800),'Color','b','LineWidth',3);
hold on
hid1 = plot(xid1,id1(1:800),'Color','m','LineWidth',3);
hold on
hid2 = plot(xid2,id2(1:800),'Color',[0.8500 0.3250 0.0980],'LineWidth',3);




%grid on
%right side plots
hold on
plot([9 17.5],[0 0],'k')%First Horizontal Line
hold on
plot([9 9],[-11 2],'k')%Vertical Line
hold on
plot([9 17.5],[-4 -4],'k')%2nd Horizontal Line
hold on
plot([9 17.5],[-7 -7],'k')%3rd Horizontal Line
hold on
plot([9 17.5],[-10 -10],'k')%4th Horizontal Line

hold on
plot([9 17.5],[1 1],'k','LineStyle',':')%1st dotted Horizontal Line
hold on
plot([9 17.5],[-1 -1],'k','LineStyle',':')%2nd dotted Horizontal Line
hold on
plot([9 17.5],[-3 -3],'k','LineStyle',':')%3rd dotted Horizontal Line
hold on
plot([9 17.5],[-6 -6],'k','LineStyle',':')%3rd dotted Horizontal Line
hold on
plot([9 17.5],[-9 -9],'k','LineStyle',':')%3rd dotted Horizontal Line


%Right Side Text for Plot
text(12,2,'SOURCE CURRENT','FontSize',8);
text(12,-2,'LOAD CURRENT','FontSize',8);
text(12,-5,'D1 & D4 CURRENT','FontSize',8);
text(12,-8,'D2 & D3 CURRENT','FontSize',8);
text(17.75,0,'\omegat','FontSize',10);
text(17.75,-4,'\omegat','FontSize',10);
text(17.75,-7,'\omegat','FontSize',10);
text(17.75,-10,'\omegat','FontSize',10);
text(8,1,'I_m','FontSize',10);
text(8,-1,'-I_m','FontSize',10);
text(8,-3,'I_m','FontSize',10);
text(8,-6,'I_m','FontSize',10);
text(8,-9,'I_m','FontSize',10);


%left side plots
hold on
plot([-12 -12],[-11 2],'k') %Vertical Line
hold on
plot([-12 -3],[0 0],'k')%First Horizontal Line
hold on
plot([-12 -3],[-4 -4],'k')%2nd Horizontal Line
hold on
plot([-12 -3],[-6 -6],'k')%3rd Horizontal Line
hold on
plot([-12 -3],[-9 -9],'k')%4th Horizontal Line
hold on
plot([-12 -3],[1 1],'k','LineStyle',':')%1st dotted Horizontal Line
hold on
plot([-12 -3],[-1 -1],'k','LineStyle',':')%2nd dotted Horizontal Line
hold on
plot([-12 -3],[-3 -3],'k','LineStyle',':')%3rd dotted Horizontal Line
hold on
plot([-12 -3],[-7 -7],'k','LineStyle',':')%3rd dotted Horizontal Line
hold on
plot([-12 -3],[-10 -10],'k','LineStyle',':')%3rd dotted Horizontal Line


%Left Side Text for Plot
text(-9,2,'SOURCE VOLTAGE','FontSize',8);
text(-9,-2,'LOAD VOLTAGE','FontSize',8);
text(-9,-5,'D1 & D4 VOLTAGE','FontSize',8);
text(-9,-8,'D2 & D3 VOLTAGE','FontSize',8);
text(-2.75,0,'\omegat','FontSize',10);
text(-2.75,-4,'\omegat','FontSize',10);
text(-2.75,-6,'\omegat','FontSize',10);
text(-2.75,-9,'\omegat','FontSize',10);
text(-13,1,'V_m','FontSize',10);
text(-13,-1,'-V_m','FontSize',10);
text(-13,-3,'V_m','FontSize',10);
text(-13,-7,'-V_m','FontSize',10);
text(-13,-10,'-V_m','FontSize',10);

%Formula box
plot([0 7 7,0,0],[-7.5 -7.5 -14.5 -14.5,-7.5],'Color',[0.9290 0.6940 0.1250],'LineWidth',3);
text(0.5,-8.5,'Average Voltage = $$\frac{2V_m}{\pi}$$','FontSize',10,'Interpreter','latex');
text(0.5,-10,'Average Current = $$I_0= \frac{2V_m}{\pi R}$$','FontSize',10,'Interpreter','latex');
text(0.5,-11.5,'RMS Voltage   = $$\frac{V_m}{\sqrt 2}$$','FontSize',10,'Interpreter','latex');
text(0.5,-13,'RMS Current   = $$I_0$$','FontSize',10,'Interpreter','latex');
text(1.5,-14,'Diode PIV= $$ V_m $$','Interpreter','latex');

%Copyright content

text(7.5,-14,'Developed by Dr.M.Kaliamoorthy, Professor and Head, Dr.MCET, Pollachi','FontSize',8);

%Animation Title
text(-1,3,'SINGLE PHASE BRIDGE RECTIFIER','FontSize',10);

axis([-2 22 -15 5],'equal','off')

%axis([-2 22 -15 5],'equal')

for x = 1:nt-1000 % subtract the time-series window length

    if vsource(800+x) < 0
        set(D2,'Color',[0.7 0.7 0.7])
        set(D4,'Color',[0.7 0.7 0.7])
        set(D1,'Color','k')
        set(D3,'Color','k')
        set(L3,'Color','k')
        set(L2,'Color','k')
        set(L1,'Color',[0.7 0.7 0.7])
        set(L4,'Color',[0.7 0.7 0.7])
        set(L5(1),'Color',[0.7 0.7 0.7]);
        set(L5(2),'Color','k');
        a.String='-';
        b.String='+';
    else
        set(D2,'Color','k')
        set(D4,'Color','k')
        set(D1,'Color',[0.7 0.7 0.7])
        set(D3,'Color',[0.7 0.7 0.7])
        set(L3,'Color',[0.7 0.7 0.7])
        set(L2,'Color',[0.7 0.7 0.7])
        set(L1,'Color','k')
        set(L4,'Color','k')
        set(L5(1),'Color','k');
        set(L5(2),'Color',[0.7 0.7 0.7]);
        a.String='+';
        b.String='-';
    end
    % Left Side plot update
    set(hvs,'YData',vsource((1:800)+x)) % update y-axis data
    set(hvl,'YData',vload((1:800)+x)) % update y-axis data
    set(hvd1,'YData',vd1((1:800)+x)) % update y-axis data
    set(hvd2,'YData',vd2((1:800)+x)) % update y-axis data

   
    % plot(xsource,vsource((1:800)+x),'Color','r','LineWidth',3);
    % plot(xload,vload((1:800)+x),'Color','b','LineWidth',3);
    % plot(xvd1,vd1((1:800)+x),'Color','m','LineWidth',3);
    % plot(xvd2,vd2((1:800)+x),'Color',[0.8500 0.3250 0.0980],'LineWidth',3);


    %Right Side Plot update
    set(his,'YData',isource((1:800)+x)) % update y-axis data
    set(hil,'YData',iload((1:800)+x)) % update y-axis data
    set(hid1,'YData',id1((1:800)+x)) % update y-axis data
    set(hid2,'YData',id2((1:800)+x)) % update y-axis data

  % plot(xisource,isource((1:800)+x),'Color','r','LineWidth',3);
  % plot(xiload,iload((1:800)+x),'Color','b','LineWidth',3);
  % plot(xid1,id1((1:800)+x),'Color','m','LineWidth',3);
  % plot(xid2,id2((1:800)+x),'Color',[0.8500 0.3250 0.0980],'LineWidth',3);
  pause(0.01)
   
    
   
    
    
end

% F(x) = getframe(hf);
% writerObj = VideoWriter('myVideo.avi');
% writerObj.FrameRate = 10;
% for i=1:length(F)
%     % convert the image to a frame
%     frame = F(i) ;    
%     writeVideo(writerObj, frame);
% end
% close(writerObj);