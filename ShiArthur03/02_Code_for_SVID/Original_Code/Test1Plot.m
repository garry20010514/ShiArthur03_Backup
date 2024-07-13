close all
load('Test1SimandExp.mat');
load('Test2SimandExp_1.mat');
load('Test2SimandExp_2.mat');
load('Test3SimandExp.mat');
%DSED.t.1=EXP.t.1.338

index=find(ia(:,1)>0.5,1);
index2=find(ia(:,1)>1.5,1);
DSED_ia=ia(index:index2,:);
DSED_ia(:,1)=DSED_ia(:,1)-0.5;
DSED_ia(:,2)=DSED_ia(:,2);

index=find(ib(:,1)>0.5,1);
index2=find(ib(:,1)>1.5,1);
DSED_ib=ib(index:index2,:);
DSED_ib(:,1)=DSED_ib(:,1)-0.5;
DSED_ib(:,2)=DSED_ib(:,2);

index=find(ic(:,1)>0.5,1);
index2=find(ic(:,1)>1.5,1);
DSED_ic=ic(index:index2,:);
DSED_ic(:,1)=DSED_ic(:,1)-0.5;
DSED_ic(:,2)=DSED_ic(:,2);

index=find(Test1_t>0.829,1);
index2=find(Test1_t>1.829,1);
EXP_t=Test1_t(index:index2)-0.829;
EXP_Current=Test1_HVACPhaseCurrent(index:index2,:);
EXP_Voltage=Test1_HVACPhaseVoltage(index:index2,:);

figure(1)
subplot(2,1,1);
plot(EXP_t,EXP_Current);

subplot(2,1,2);
plot(DSED_ib(:,1),DSED_ib(:,2));  hold on;
plot(DSED_ia(:,1),DSED_ia(:,2));  hold on;
plot(DSED_ic(:,1),DSED_ic(:,2));  hold on;
xlim([0, 1]);

figure(2)
subplot(2,1,1);
plot(EXP_t,EXP_Current); xlim([0.4,0.6]);
subplot(2,1,2);
plot(DSED_ib(:,1),DSED_ib(:,2));  xlim([0.4,0.6]);hold on;
plot(DSED_ia(:,1),DSED_ia(:,2));  xlim([0.4,0.6]);hold on;
plot(DSED_ic(:,1),DSED_ic(:,2)); xlim([0.4,0.6]);hold on;


%% Voltage
index1=find(EXP_t>0.45,1);
index2=find(EXP_t>0.55,1);
EXP_t_v=EXP_t(index1:index2);
EXP_v_045055=EXP_Voltage(index1:index2,:);

index1=find(DSED_ia(:,1)>0.45,1);
index2=find(DSED_ia(:,1)>0.55,1);

DSED_t_v=DSED_ia(index1:index2,1);
DSED_v=8165*cos(2*pi*50*DSED_t_v+pi/1.9);
DSED_v(:,2)=8165*cos(2*pi*50*DSED_t_v-2*pi/3+pi/1.9);
DSED_v(:,3)=8165*cos(2*pi*50*DSED_t_v-4*pi/3+pi/1.9);
figure();
subplot(2,1,1);
plot(EXP_t_v,EXP_v_045055);
subplot(2,1,2);
plot(DSED_t_v,DSED_v);