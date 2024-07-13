close all
set(0,'defaultfigurecolor','w')
set(gcr,'color','w')

figure(1);
subplot(2,1,1);
plot(Test1IHVDC(:,1),-1*Test1IHVDC(:,2),'color','#4c221b'); 
xlim([0,2]); ylim([20,50]); xlabel("Time/s"); 
ylabel("\itI\rm_H_D / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);

DSIMIHVDC=csvread("DSIM-IHVDC.csv",1,0);
DSIMIHVDC(:,2)=(DSIMIHVDC(:,2));
DSIMIHVDC(:,1)=(DSIMIHVDC(:,1)-DSIMIHVDC(1,1)-0.04)/0.6*10;
subplot(2,1,2);
plot(DSIMIHVDC(:,1),DSIMIHVDC(:,2),'color','#3b2e7e');
xlim([0,2]);  ylim([-20,50]); xlabel("Time/s"); 
ylabel("\itI\rm_H_D / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);

figure(2);
subplot(2,1,1);
plot(Test2IC1(:,1),Test2IC1(:,2),'color','#4c221b'); 
xlim([0,0.1]); 
ylim([-50,50]); 
xlabel("Time/s"); 
ylabel("\itI\rm_H_A / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);

DSIMIHVDC=csvread("DSIM-IC1.csv",1,0);
DSIMIHVDC(:,2)=(DSIMIHVDC(:,2));
DSIMIHVDC(:,1)=DSIMIHVDC(:,1)-0.6732;
subplot(2,1,2);
plot(DSIMIHVDC(:,1),DSIMIHVDC(:,2),'color','#3b2e7e');
xlim([0,0.1]);  
ylim([-50,50]); 
xlabel("Time/s"); 
ylabel("\itI\rm_H_A / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);



figure(3);
subplot(2,1,1);
plot(Test2IHVAC1(:,1),Test2IHVAC1(:,2),'color','#4c221b'); 
xlim([0.75,0.77]); 
ylim([-500,500]); 
xlabel("Time/s"); 
ylabel("\itI\rm_D_A_B / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);

DSIMIHVAC2=csvread("DSIM-IHVAC2.csv",1,0);
DSIMIHVAC2(:,2)=(DSIMIHVAC2(:,2));
DSIMIHVAC2(:,1)=DSIMIHVAC2(:,1)-0.1616+0.75;
subplot(2,1,2);
plot(DSIMIHVAC2(:,1),DSIMIHVAC2(:,2),'color','#3b2e7e');
xlim([0.75,0.77]); 
ylim([-500*6/405,500*6/405]); 
xlabel("Time/s"); 
ylabel("\itI\rm_D_A_B / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);


figure(4);
subplot(2,1,1);
plot(Test2IHVAC1(:,1),Test2IHVAC1(:,2),'color','#4c221b'); 
xlim([0.755,0.755+0.0005]); 
ylim([-500,500]); 
xlabel("Time/s"); 
ylabel("\itI\rm_D_A_B / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);

subplot(2,1,2);
DSIMIHVAC2(:,2)= DSIMIHVAC2(:,2);
plot(DSIMIHVAC2(:,1),DSIMIHVAC2(:,2),'color','#3b2e7e');
xlim([0.755,0.755+0.0005]); 
ylim([-500*6/405/345*401,500*6/405/345*401]); 
xlabel("Time/s"); 
ylabel("\itI\rm_D_A_B / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);



figure(5);
subplot(2,1,1);
plot(Test2YBLVDC(:,1),Test2YBLVDC(:,2),'color','#4c221b'); 
xlim([0.03211,0.03211+0.00025]); 
ylim([-2000,2000]); 
xlabel("Time/s"); 
ylabel("\itU\rm_H_L_A / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);

DSIMYBLVDC=csvread("DSIM-YBLVDC.csv",1,0); 
DSIMYBLVDC(:,2)=(DSIMYBLVDC(:,2));
    
DSIMYBLVDC(:,1)=DSIMYBLVDC(:,1)-0.0162874+0.03211;
subplot(2,1,2);
plot(DSIMYBLVDC(:,1),DSIMYBLVDC(:,2),'color','#3b2e7e'); 
xlim([0.03211,0.03211+0.00025]); 
ylim([-2000,2000]); 
xlabel("Time/s"); 
ylabel("\itU\rm_H_L_A / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);


figure(6);
% subplot(2,1,1);
plot(Test2YBLVDC(:,1),Test2YBLVDC(:,2),'color','#4c221b'); 
hold on; 
xlim([0.075074,0.075078]); 
ylim([-2000,2000]); 
xlabel("Time/s"); 
ylabel("\itU\rm_H_L_A / A"); grid on;
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);

DSIMTR1=csvread("DSIM-TR-1.csv",1,0);
DSIMTR1(:,1)=(DSIMTR1(:,1));
DSIMTR1(:,1)=(DSIMTR1(:,1))-DSIMTR1(1,1)+0.075074-0.0000111*1.6+0.0000072;
plot(DSIMTR1(:,1),DSIMTR1(:,2),'--','color','#3b2e7e');
legend ('Experiment','Simulation');
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',10);