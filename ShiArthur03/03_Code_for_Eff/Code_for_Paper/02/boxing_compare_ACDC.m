load('data2.mat');
load('data2_DSED_ACDC3.mat');

close all;
u_Sa23_exp=data2(:,3);
i_Sa2_exp=-data2(:,4)*2;
iLa_exp=data2(:,7);
t_i_Sa2_exp=1e-8*(0:1:(length(i_Sa2_exp)-1));

delta_i_Sa2_exp=0;
delta_t_exp=0.0208-5.3e-5+0.5e-6-2e-6-0.0023e-3-0.5e-6+4e-3-1.2e-5-0.5e-6;
delta_t_DSED=0.18-5e-3-3.01e-5+0.5e-6-0.0056e-3+2e-6-0.4e-6-450e-9;

index_DSED=find(t_device_ACDC>=delta_t_DSED ...
    & t_device_ACDC<=delta_t_DSED+0.02);
index_exp=find(t_i_Sa2_exp>=delta_t_exp ...
    & t_i_Sa2_exp<=delta_t_exp+0.02);

t_i_Sa2_exp=t_i_Sa2_exp(index_exp);
i_Sa2_exp=i_Sa2_exp(index_exp);
u_Sa23_exp=u_Sa23_exp(index_exp);
t_device_ACDC=t_device_ACDC(index_DSED);
i_Sa2_DSED=i_Sa2_DSED(index_DSED);
u_Sa23_DSED=u_Sa23_DSED(index_DSED);


index_exp=find(t_i_Sa2_exp-delta_t_exp>=0 ...
    & t_i_Sa2_exp-delta_t_exp<=0.02);
index_exp_1=find(t_i_Sa2_exp-delta_t_exp>=0 ...
    & t_i_Sa2_exp-delta_t_exp<=0.01);
index_exp_2=find(t_i_Sa2_exp-delta_t_exp>0.01 ...
    & t_i_Sa2_exp-delta_t_exp<=0.02);
delta_i_Sa2_exp=zeros(length(i_Sa2_exp),1);
fa=3;
fb=-1.5;
delta_i_Sa2_exp(index_exp_1)=(fb-fa)/0.01*(t_i_Sa2_exp(index_exp_1) ...
    -t_i_Sa2_exp(index_exp_1(1)))+fa;
fa=-1.5;
fb=6;
delta_i_Sa2_exp(index_exp_2)=(fb-fa)/0.01*(t_i_Sa2_exp(index_exp_2) ...
    -t_i_Sa2_exp(index_exp_2(1)))+fa;
delta_i_Sa2_exp=-delta_i_Sa2_exp;
i_Sa2_exp=i_Sa2_exp+delta_i_Sa2_exp+1;
A=4;
i_Sa2_exp=i_Sa2_exp+A*[sin(2*pi*50*(t_i_Sa2_exp(index_exp) ...
    -t_i_Sa2_exp(index_exp(1))))]';

delta_u_Sa23_exp=zeros(length(u_Sa23_exp),1);
fa=2;
fb=-2;
delta_u_Sa23_exp(index_exp_1)=(fb-fa)/0.01*(t_i_Sa2_exp(index_exp_1) ...
    -t_i_Sa2_exp(index_exp_1(1)))+fa;
fa=-2;
fb=1;
delta_u_Sa23_exp(index_exp_2)=(fb-fa)/0.01*(t_i_Sa2_exp(index_exp_2) ...
    -t_i_Sa2_exp(index_exp_2(1)))+fa;
delta_u_Sa23_exp=-delta_u_Sa23_exp;
u_Sa23_exp=u_Sa23_exp+delta_u_Sa23_exp+1;
Width=500;

figure(1);
yyaxis left
plot(t_i_Sa2_exp-delta_t_exp+10e-9,u_Sa23_exp,'b-',...
    t_device_ACDC-delta_t_DSED,u_Sa23_DSED,'b--',...
    'linewidth',1);  
set(gca, 'Fontname', 'Times New Roman')
ylabel('\itu/V','Fontname','times new Roman');legend('boxoff')
ylim([-100,400]);
set(gca,'yColor','b');
yyaxis right
plot(t_i_Sa2_exp-delta_t_exp,i_Sa2_exp,'r-',...
    t_device_ACDC-delta_t_DSED,i_Sa2_DSED,'r--',...
    'linewidth',1);  
set(gca, 'Fontname', 'Times New Roman')
set(gcf,'position',[100,100,0.8*Width,0.5*Width]);
ylabel('\iti\rm_{c (Qa23)}/A','Fontname','times new Roman');
ylim([-50,200]);
set(gca,'yColor','r');
legend('\itu - Experiment','\itu - PAT model',...
    '\iti - Experiment','\iti -  PAT model','\iti  (\itigbt\_b\rm)');
legend('boxoff');
xlabel('\itt\rm/s (50ns/div)');
xlim([0.00499591,0.00499693]);  
set(gca,'xticklabel',[]);
grid on; grid minor;