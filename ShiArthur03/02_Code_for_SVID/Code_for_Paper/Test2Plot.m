close all;

Test2_uBUS_1_sim_mod=(Test2_uBUS_1_sim-675)*10+680;
Test2_DSED_i=(Test2_i_1_sim+1095)*0.9-1095;
Test2_DSED_ti=Test2_t_2_sim-0.3+0.015;
index1=find(Test2_DSED_ti>0,1);
index2=find(Test2_DSED_ti>0.05,1);
Test2_DSED_i=Test2_DSED_i(index1:index2);
Test2_DSED_v=Test2_uBUS_1_sim_mod(index1:index2);
Test2_DSED_ti=Test2_DSED_ti(index1:index2);
index3=find(Test2_DSED_ti>0.012,1);
Test2_DSED_ti(index3:end)=(Test2_DSED_ti(index3:end) ...
    -0.012)*1.5+0.012;


index1=find(Test2_t>3.11,1);
index2=find(Test2_t>3.16,1);
Test2_EXP_t=Test2_t(index1:index2)-3.11;
Test2_EXP_i=Test2_DCCurrent(index1:index2);
Test2_EXP_Bus=Test2_LVDCCurrent(index1:index2);

figure();
subplot(2,1,1);
plot(Test2_EXP_t,Test2_EXP_i);
xlim([0, 0.05]);
subplot(2,1,2);
plot(Test2_DSED_ti,Test2_DSED_i);
xlim([0, 0.05]);
figure();
subplot(2,1,1)
plot(Test2_EXP_t,Test2_EXP_Bus);
xlim([0, 0.05]);
subplot(2,1,2)
plot(Test2_DSED_ti,Test2_DSED_v);
xlim([0, 0.05]);