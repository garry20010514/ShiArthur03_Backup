close all

%% DC BUS
DSED_bus=Test3_bus_sim;
DSED_bus=2.5*(Test3_bus_sim-670)+670;
DSED_t_bus=Test3_t_sim*3-0.002;

index1=find(DSED_t_bus>0.5,1);
index2=find(DSED_t_bus>1,1);
DSED_t_bus=DSED_t_bus(index1:index2)-0.5;
DSED_bus=DSED_bus(index1:index2);

index1=find(Test3_t>0.5,1);
index2=find(Test3_t>1,1);
EXP_t_bus=Test3_t(index1:index2)-0.5;
EXP_bus=Test3_LVACbus(index1:index2);

figure(1);
subplot(2,1,1);
plot(EXP_t_bus,EXP_bus);
xlim([0.1, 0.5]);
subplot(2,1,2);
plot(DSED_t_bus,DSED_bus);
xlim([0.1, 0.5]);


figure(2);
subplot(2,1,1);
plot(EXP_t_bus,EXP_bus);
xlim([0.2, 0.25]);

subplot(2,1,2);
plot(DSED_t_bus,DSED_bus);
xlim([0.2, 0.25]);

%% Phase Current

index1=find(Test3_t_sim>0.1983,1);
index2=find(Test3_t_sim>0.3983,1);
DSED_t_i=Test3_t_sim(index1:index2)-0.1983;
DSED_i=Test3_i_sim(index1:index2,:);

index1=find(Test3_t>2.1,1);
index2=find(Test3_t>2.3,1);
EXP_t_i=Test3_t(index1:index2)-2.1;
EXP_i=Test3_LVACPhaseCurrent(index1:index2,:);

% figure(3);
% subplot(2,1,1);
% plot(EXP_t_i,EXP_i);
% xlim([0, 0.2]);
% 
% subplot(2,1,2);
% plot(DSED_t_i,DSED_i(:,2));hold on;
% plot(DSED_t_i,DSED_i(:,1));hold on;
% plot(DSED_t_i,DSED_i(:,3));hold on;
% xlim([0, 0.2]);





