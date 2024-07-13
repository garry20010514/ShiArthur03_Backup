close all; clear;
load('data4.mat');
% load('data4_DSED_DCAC.mat');  % 旧数据
% load('data4_DSED_DCAC1.mat');
load('data4_DSED_DCAC3.mat');
load('data4_simulink_DCAC.mat');
% load('data4_Saber_DCAC.mat');
% load('data4_Saber_DCAC_transient.mat');
load('data4_Saber_DCAC3.mat');
u_So1_exp=-data4(:,4);
u_So1_exp=(u_So1_exp-5);
i_So1_exp=-data4(:,3)*10;
iLa_exp=data4(:,9);
t_i_So1_exp=1e-8*(0:1:(length(i_So1_exp)-1));
i_So1_simulink=i_So1_Simulink.signals.values;
u_So1_simulink=u_So1_Simulink.signals.values;
u_So1_simulink=u_So1_simulink;
t_So1_simulink=i_So1_Simulink.time;
delta_t_exp=0.0208-5.3e-5-4e-6-2.3e-6+14e-3-1e-4+10e-9;
delta_t_DSED=0.48-0.01-3.6576e-4-20e-9+127e-9+10e-9;
delta_t_simulink=delta_t_DSED-0.4-1.25e-4;
delta_t_Saber=0.1-0.03-4.5e-4+2.15e-9-5e-6+2e-5+2.5e-7-1.1e-4-400e-9;
% t_So1_Saber=10e-9*((1:length(i_So1_Saber))-1);
index_exp_1=find(t_i_So1_exp-delta_t_exp>=0 & t_i_So1_exp-delta_t_exp<=0.01);
index_exp_2=find(t_i_So1_exp-delta_t_exp>0.01 & t_i_So1_exp-delta_t_exp<=0.02);
delta_i_So1_exp=zeros(length(i_So1_exp),1);
fa=i_So1_exp(index_exp_1(1))+3;
fb=i_So1_exp(index_exp_1(length(index_exp_1)))+1;
delta_i_So1_exp(index_exp_1)=(fb-fa)/0.01*(t_i_So1_exp(index_exp_1)-t_i_So1_exp(index_exp_1(1)))+fa;
fa=i_So1_exp(index_exp_2(1))+1;
fb=i_So1_exp(index_exp_2(length(index_exp_2)));
delta_i_So1_exp(index_exp_2)=(fb-fa)/0.01*(t_i_So1_exp(index_exp_2)-t_i_So1_exp(index_exp_2(1)))+fa;
delta_i_So1_exp=-delta_i_So1_exp;
i_So1_exp=i_So1_exp;
i_So1_exp=[i_So1_exp(3:length(i_So1_exp));zeros(2,1)];
% u_So1_exp=[u_So1_exp(2:length(u_So1_exp));zeros(1,1)];

delta_u_So1_exp=zeros(length(i_So1_exp),1);
fa=3;
fb=5;
delta_u_So1_exp(index_exp_1)=(fb-fa)/0.01*(t_i_So1_exp(index_exp_1)-t_i_So1_exp(index_exp_1(1)))+fa;
fa=5;
fb=0;
delta_u_So1_exp(index_exp_2)=(fb-fa)/0.01*(t_i_So1_exp(index_exp_2)-t_i_So1_exp(index_exp_2(1)))+fa;
delta_u_So1_exp=-delta_u_So1_exp;
u_So1_exp=u_So1_exp;

figure(1);
subplot(4,1,1);
plot(t_i_So1_exp-delta_t_exp,i_So1_exp,'b','linewidth',1);
set(gca,'xticklabel',[]);
set(gca, 'Fontname', 'Times New Roman')
legend1=legend('Experiment','Location','northwest');
set(legend1,...
    'Position',[0.146302250803859 0.865461847389558 0.258038585209003 0.0542168674698795]);
xlim([0,0.02]);
ylim([-100,200]);
ylabel('\iti\rm_{c (Qo1)}/A','Fontname','times new Roman');legend('boxoff')
grid on; grid minor;
subplot(4,1,2);
plot(t_device_DCAC-delta_t_DSED,i_So1_DSED,'r','linewidth',1);
set(gca,'xticklabel',[]);
set(gca, 'Fontname', 'Times New Roman')
legend1=legend('DSED Simulation with PAT model','Location','northwest');legend('boxoff')
set(legend1,...
    'Position',[0.147106109324761 0.560240963855421 0.333601286173633 0.0542168674698795]);
xlim([0,0.02]);
ylim([-100,200]);
ylabel('\iti\rm_{c (Qo1)}/A','Fontname','times new Roman');
grid on; grid minor;
subplot(4,1,4);
plot(t_So1_simulink-delta_t_simulink,i_So1_simulink,'k','linewidth',1);
set(gca, 'Fontname', 'Times New Roman')
legend('Simulink Simulation with ideal model','Location','northwest');legend('boxoff')
xlim([0,0.02]);
ylim([-100,200]);
ylabel('\iti\rm_{c (Qo1)}/A','Fontname','times new Roman');
xlabel('\itt\rm/s','Fontname','times new Roman');
grid on; grid minor;
subplot(4,1,3);
plot(t_So1_Saber-delta_t_Saber,i_So1_Saber,'m','linewidth',1);
set(gca,'xticklabel',[]);
set(gca, 'Fontname', 'Times New Roman')
legend('Saber simulation with physical model (\itigbt\_b\rm)');legend('boxoff')
xlim([0,0.02]);
ylim([-100,200]);
ylabel('\iti\rm_{c (Qo1)}/A','Fontname','times new Roman');
grid on; grid minor;

figure(2);
subplot(4,1,1);
plot(t_i_So1_exp-delta_t_exp,u_So1_exp,'b','linewidth',1);
set(gca,'xticklabel',[]);
set(gca, 'Fontname', 'Times New Roman')
legend1=legend('Experiment','Location','northwest');legend('boxoff')
set(legend1,...
    'Position',[0.146302250803859 0.865461847389558 0.258038585209003 0.0542168674698795]);
ylabel('\itu\rm_{ce (Qo1)}/V','Fontname','times new Roman');
xlim([0,0.02]);
ylim([-50,400]);
grid on; grid minor;
subplot(4,1,2);
plot(t_device_DCAC-delta_t_DSED,u_So1_DSED,'r','linewidth',1);
set(gca,'xticklabel',[]);
set(gca, 'Fontname', 'Times New Roman')
legend1=legend('DSED Simulation with PAT model','Location','northwest');legend('boxoff');
set(legend1,...
    'Position',[0.147106109324761 0.560240963855421 0.333601286173633 0.0542168674698795]);
ylabel('\itu\rm_{ce (Qo1)}/V','Fontname','times new Roman');
xlim([0,0.02]);
ylim([-50,400]);
grid on; grid minor;
subplot(4,1,4);
plot(t_So1_simulink-delta_t_simulink,u_So1_simulink,'k','linewidth',1);
set(gca, 'Fontname', 'Times New Roman')
legend1=legend('Simulink Simulation with ideal model','Location','northwest');legend('boxoff')
set(legend1,...
    'Position',[0.14630225080386 0.262048192771084 0.364147909967846 0.0542168674698795]);
ylabel('\itu\rm_{ce (Qo1)}/V','Fontname','times new Roman');
xlim([0,0.02]);
ylim([-50,400]);
xlabel('\itt\rm/s','Fontname','times new Roman');
grid on; grid minor;
subplot(4,1,3);
plot(t_So1_Saber-delta_t_Saber,u_So1_Saber,'m','linewidth',1);
% plot(t_So1_simulink-delta_t_simulink,u_So1_simulink,'m','linewidth',1);
set(gca,'xticklabel',[]);
set(gca, 'Fontname', 'Times New Roman')
legend('Saber simulation with physical model (\itigbt\_b\rm)');legend('boxoff')
ylabel('\itu\rm_{ce (Qo1)}/V','Fontname','times new Roman');
xlim([0,0.02]);
ylim([-50,400]);
grid on; grid minor;

% figure(3);
% subplot(4,1,1);
% plot(t_i_So1_exp-delta_t_exp,i_So1_exp,'b','linewidth',1);
% legend1=legend('Experiment','Location','northeast','Fontname','times new Roman');legend('boxoff');
% set(gca, 'Fontname', 'Times New Roman')
% xlim([0.015,0.017]);
% ylim([-100,200]);
% ylabel('\iti\rm_{c (Qo1)}/A','Fontname','times new Roman');
% grid on; grid minor;
% subplot(4,1,2);
% plot(t_device_DCAC-delta_t_DSED,i_So1_DSED,'r','linewidth',1);
% legend1=legend('DSED Simulation with PAT model','Location','northeast','Fontname','times new Roman');legend('boxoff');
% set(gca, 'Fontname', 'Times New Roman')
% xlim([0.015,0.017]);
% ylim([-100,200]);
% ylabel('\iti\rm_{c (Qo1)}/A','Fontname','times new Roman');
% grid on; grid minor;
% subplot(4,1,3);
% plot(t_So1_simulink-delta_t_simulink,i_So1_simulink,'k','linewidth',1);
% legend1=legend('Simulink Simulation with ideal model','Location','northeast','Fontname','times new Roman');legend('boxoff');
% set(gca, 'Fontname', 'Times New Roman')
% xlim([0.015,0.017]);
% ylim([-100,200]);
% ylabel('\iti\rm_{c (Qo1)}/A','Fontname','times new Roman');
% xlabel('\itt\rm/s','Fontname','times new Roman');
% grid on; grid minor;
% 
% figure(4);
% subplot(4,1,1);
% plot(t_i_So1_exp-delta_t_exp,u_So1_exp,'b','linewidth',1);
% legend1=legend('Experiment','Location','northwest','Fontname','times new Roman');legend('boxoff');
% set(gca, 'Fontname', 'Times New Roman')
% ylabel('\itu\rm_{ce (Qo1)}/V','Fontname','times new Roman');
% xlim([0.015,0.017]);
% ylim([-50,700]);
% grid on; grid minor;
% subplot(4,1,2);
% plot(t_device_DCAC-delta_t_DSED,u_So1_DSED,'r','linewidth',1);
% legend1=legend('DSED Simulation with PAT model','Location','northwest','Fontname','times new Roman');legend('boxoff');
% set(gca, 'Fontname', 'Times New Roman')
% ylabel('\itu\rm_{ce (Qo1)}/V','Fontname','times new Roman');
% xlim([0.015,0.017]);
% ylim([-50,700]);
% grid on; grid minor;
% subplot(4,1,3);
% plot(t_So1_simulink-delta_t_simulink,u_So1_simulink,'k','linewidth',1);
% legend1=legend('Simulink Simulation with ideal model','Location','northwest','Fontname','times new Roman');legend('boxoff');
% set(gca, 'Fontname', 'Times New Roman')
% ylabel('\itu\rm_{ce (Qo1)}/V','Fontname','times new Roman');
% xlim([0.015,0.017]);
% ylim([-50,700]);
% xlabel('\itt\rm/s','Fontname','times new Roman');
% grid on; grid minor;

index=1:length(u_So1_Saber);

figure(5);
yyaxis left
plot(t_i_So1_exp-delta_t_exp,u_So1_exp,'b-',...
    t_device_DCAC-delta_t_DSED,u_So1_DSED,'b--',...
    t_So1_Saber(index(1))-delta_t_Saber+5e-9*(index-index(1)),u_So1_Saber(index),'b:','linewidth',1);
ylabel('\itu\rm_{ce (Qo1)}/V','Fontname','times new Roman');
ylim([-50,400]);
set(gca,'yColor','b');
yyaxis right
plot(t_i_So1_exp-delta_t_exp,i_So1_exp+3,'r-',...
    t_device_DCAC-delta_t_DSED,i_So1_DSED,'r--',...
    t_So1_Saber(index(1))-delta_t_Saber+5e-9*(index-index(1)),i_So1_Saber(index),'r:','linewidth',1);
ylabel('\iti\rm_{c (Qo1)}/A','Fontname','times new Roman');
ylim([-25,200]);
set(gca,'yColor','r');
legend('\itu\rm_{ce (Qo1)} - Experiment','\itu\rm_{ce (Qo1)} - DSED Simulation with PAT model','\itu\rm_{ce (Qo1)} - Saber simulation with physical model (\itigbt\_b\rm)',...
    '\iti\rm_{c (Qo1)} - Experiment','\iti\rm_{c (Qo1)} - DSED Simulation with PAT model','\iti\rm_{c (Qo1)} - Saber simulation with physical model (\itigbt\_b\rm)');
legend('boxoff');
set(gca, 'Fontname', 'Times New Roman')
xlabel('t (50ns/div)');
% xlim([0,0.02]);
xlim([0.016-0.5e-6,0.016+0e-6]+200e-9+40e-9);  % 开通过程
% xlim(0.0145+[-1.7799e-05,-1.5823e-05]+40e-9);  % 关断过程
% set(gca,'xticklabel',[]);
grid on;

figure(6);
subplot(2,1,1);
plot(t_i_So1_exp-delta_t_exp,u_So1_exp.*i_So1_exp/1e3,'b','linewidth',1);
legend1=legend('Experiment','Location','northwest','Fontname','times new Roman');legend('boxoff');
set(gca, 'Fontname', 'Times New Roman')
set(gca,'xticklabel',[]);
ylabel('\itP\rm_{loss (Qo1)}/kW','Fontname','times new Roman');
xlim([0,0.02]);
ylim([0,60]);
grid on; grid minor;
subplot(2,1,2);
plot(t_device_DCAC-delta_t_DSED,u_So1_DSED.*i_So1_DSED/1e3,'r','linewidth',1);
legend1=legend('DSED Simulation with PAT model','Location','northwest','Fontname','times new Roman');legend('boxoff');
set(gca, 'Fontname', 'Times New Roman')
ylabel('\itP\rm_{loss (Qo1)}/kW','Fontname','times new Roman');
xlim([0,0.02]);
ylim([0,60]);
xlabel('\itt\rm/s','Fontname','times new Roman');
grid on; grid minor;
% subplot(3,1,3);
% plot(t_So1_simulink-delta_t_simulink,u_So1_simulink.*i_So1_simulink/1e3,'k','linewidth',1);
% legend1=legend('Simulink Simulation with ideal model','Location','northwest','Fontname','times new Roman');legend('boxoff');
% set(gca, 'Fontname', 'Times New Roman')
% ylabel('\itP\rm_{loss (Qo1)}/kW','Fontname','times new Roman');
% xlim([0,0.02]);
% ylim([0,60]);
% xlabel('\itt\rm/s','Fontname','times new Roman');
% grid on; grid minor;

index_DSED=find(t_device_DCAC>=delta_t_DSED+0.0 & t_device_DCAC<=delta_t_DSED+0.02);
index_simulink=find(t_So1_simulink>=delta_t_simulink+0.0 & t_So1_simulink<=delta_t_simulink+0.02);
index_exp=find(t_i_So1_exp>=delta_t_exp+0.0 & t_i_So1_exp<=delta_t_exp+0.02);
index_Saber=find(t_So1_Saber>=delta_t_Saber+0.0 & t_So1_Saber<=delta_t_Saber+0.02);

loss_exp=loss_cal(u_So1_exp,i_So1_exp,t_i_So1_exp,index_exp,1);
loss_DSED=loss_cal(u_So1_DSED,i_So1_DSED,t_device_DCAC,index_DSED,0);
loss_simulink=loss_cal(u_So1_simulink,i_So1_simulink,t_So1_simulink,index_simulink,0);
figure(7);
plot(t_i_So1_exp(index_exp)-delta_t_exp,loss_exp,'b-',...
    t_device_DCAC(index_DSED)-delta_t_DSED,loss_DSED,'r-',...
    t_So1_simulink(index_simulink)-delta_t_simulink,loss_simulink,'k-','linewidth',1);
xlim([0.0,0.02]);
xlabel('\itt\rm/s','Fontname','times new Roman');ylabel('\itE\rm_{loss (Qo1)}/mJ','Fontname','times new Roman');
legend1=legend('Experiment','DSED Simulation with PAT model','Simulink Simulation with ideal model','Location','northwest','Fontname','times new Roman');legend('boxoff');
set(gca, 'Fontname', 'Times New Roman')
grid on; grid minor;