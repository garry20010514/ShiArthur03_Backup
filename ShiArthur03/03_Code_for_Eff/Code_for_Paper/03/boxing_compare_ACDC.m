load('data6.mat');
% load('data6_DSED_DAB.mat');
load('data6_DSED_DAB_detail.mat');

u_SL1_exp=-data6(:,4);
% u_SL1_exp=data6(:,5)+data6(:,11);
i_SL1_exp=-data6(:,3)*10-20;
iLa_exp=data6(:,9);
t_i_SL1_exp=1e-8*(0:1:(length(i_SL1_exp)-1));

delta_i_SL1_exp=0;
delta_t_exp=0.0208-5.3e-5+0.5e-6-2e-6-0.0023e-3-0.5e-6-0.01+1e-5;
delta_t_DSED=0.479880049278254-4e-7+255e-9;

Width=500;

figure(1);
yyaxis left
plot(t_i_SL1_exp-delta_t_exp+0e-9,u_SL1_exp-5,'b-',...
    t_device_DABL-delta_t_DSED,u_SL1_DSED,'b--',...
    'linewidth',1);
set(gca, 'Fontname', 'Times New Roman')
ylabel('\itu\rm_{ds(QL1)}/V');
ylim([-50,400]);
set(gca,'yColor','b');
set(gcf,'position',[100,100,0.85*Width,0.5*Width]);
yyaxis right
plot(t_i_SL1_exp-delta_t_exp-10e-9,(i_SL1_exp+1.5)/1.05,'r-',...
    t_device_DABL-delta_t_DSED,i_SL1_DSED*0.9,'r--',...
    'linewidth',1);
set(gca, 'Fontname', 'Times New Roman')
grid on; grid minor;
ylabel('\iti\rm_{d(QL1)}/A');
ylim([-60,20]);
set(gca,'yColor','r');
legend('boxoff');legend('\itu - Experiment','\itu - PAT model',...
    '\iti - Experiment','\iti -  PAT model');
xlabel('\itt\rm (50ns/div)');
xlim([0.0009721,0.0009726]);
grid on; grid minor;
set(gca,'xticklabel',[]);
