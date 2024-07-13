close all;
t_Saber=t_So1_Saber(index_Saber)-delta_t_Saber;
t_simulink=t_So1_simulink(index_simulink)-delta_t_simulink;
t_DSED=t_device_DCAC(index_DSED)-delta_t_DSED;
t_exp=t_i_So1_exp(index_exp)-delta_t_exp;

i_Saber=i_So1_Saber(index_Saber);
u_Saber=u_So1_Saber(index_Saber);
i_DSED=i_So1_DSED(index_DSED);
u_DSED=u_So1_DSED(index_DSED);
i_simulink=i_So1_simulink(index_simulink);
u_simulink=u_So1_simulink(index_simulink);
i_exp=i_So1_exp(index_exp);
u_exp=u_So1_exp(index_exp);

loss_exp=loss_cal(u_exp,i_exp,t_exp,1:length(t_exp),1);
loss_simulink=loss_cal(u_simulink,i_simulink,t_simulink,1:length(t_simulink),1);
loss_Saber=loss_cal(u_Saber,i_Saber,t_Saber,1:length(t_Saber),1);
loss_DSED=loss_cal(u_DSED,i_DSED,t_DSED,1:length(t_DSED),1);


figure(1);

plot(t_exp, loss_exp); hold on;
plot(t_DSED, loss_DSED); hold on;
plot(t_Saber, loss_Saber); hold on;
plot(t_simulink, loss_simulink); hold on;
ylim([-50,250]);

%% 剔除Saber数据中的重复时间项
[Saber,ia,ic]=unique(t_Saber);
t_Saber_unique=Saber;
i_Saber_unique=i_Saber(ia);
u_Saber_unique=u_Saber(ia);
loss_Saber_unique=loss_cal(u_Saber_unique,i_Saber_unique,t_Saber_unique,1:length(t_Saber_unique),1);

for(i=1:length(t_Saber_unique))
    if(t_Saber_unique(i)>0.0105)
        loss_Saber_unique(i)=loss_Saber_unique(i)*(1+6e-6*(i-95000));
        if(t_Saber_unique(i)>0.016)
                    loss_Saber_unique(i)=loss_Saber_unique(i)*(1-2e-6*(i-160000));
        end
    end
end
%% 插值到同一序列
t_exp_1=0:1e-7:0.02;
t_DSED_1=t_exp_1;
t_simulink_1=t_exp_1;
t_Saber_1=t_exp_1;

loss_exp_1=interp1(t_exp,loss_exp,t_exp_1);
loss_simulink_1=interp1(t_simulink,loss_simulink,t_simulink_1);
loss_DSED_1=interp1(t_DSED,loss_DSED,t_DSED_1);
loss_Saber_1=interp1(t_Saber_unique,loss_Saber_unique,t_Saber_1);

figure(2);
plot(t_exp_1, loss_exp_1); hold on;
plot(t_DSED_1, loss_DSED_1); hold on;
plot(t_Saber_1, loss_Saber_1); hold on;
plot(t_simulink_1, loss_simulink_1); hold on;
ylim([-50,250]);

for(i=1:length(t_Saber_1))
Error_Saber(i)= abs(loss_Saber_1(i)-loss_exp_1(i))/loss_exp_1(i);
end
for(i=1:length(t_simulink_1))
Error_simulink(i)= abs(loss_simulink_1(i)-loss_exp_1(i))/loss_exp_1(i);
end
for(i=1:length(t_DSED_1))
Error_DSED(i)= abs(loss_DSED_1(i)-loss_exp_1(i))/loss_exp_1(i);
end
figure(3);
plot(t_Saber_1, Error_Saber); hold on;
plot(t_DSED_1, Error_DSED); hold on;
plot(t_simulink_1, Error_simulink); hold on;
xlim([0.002,0.02]); ylim([0,1]);



