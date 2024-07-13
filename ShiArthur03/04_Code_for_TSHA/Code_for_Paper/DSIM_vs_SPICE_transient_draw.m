close all; clear all
mycolor = [85, 53, 127; % purple DSIM
    140, 21, 21; % Stanford cardinal red for SPICE
    0, 178, 226; %blue simulink
    100, 100, 100; %transient i
    255, 72, 53; %transient v
    0, 164, 220; %"The Economist" blue
    0, 137, 130; %"The Economist" dark green
    0, 166, 82; %green
    240, 133, 39; %orange
    227, 13, 132; %pink
    254, 220, 25]; %yellow
mycolor = mycolor ./ 255;

LineWidth =2;   %the line width of the curves
FontSize = 12;   %the font size for the labels
Width = 250;

%% Transient data

transient_dsim=importdata('DSIM_MAIN_400us_VdsId2.txt');
tt_d = transient_dsim.data(:,1) * 1e3;
Id_d = transient_dsim.data(:,2);
Vds_d = transient_dsim.data(:,3);

transient_dsim3=importdata('DSIM_MAIN_400us_VdsId3.txt');
transient_dsim3.data(5693,3)=25;
tt_d3 = transient_dsim3.data(:,1) * 1e3;
Id_d3 = transient_dsim3.data(:,2);
Vds_d3 = transient_dsim3.data(:,3);

% i = find(tt_d3>  1.586915231e-1);
% 
% tt_d3(i)=tt_d3(i)+0.00025e-1;

transient_spice=importdata('BWT_SPICE_400us_maxstep0.1n_transient2.txt');
tt_s = transient_spice.data(:,1) * 1e3;
Id_s = transient_spice.data(:,3);
Vds_s = transient_spice.data(:,2);

%% Transient waveform H1S1
fig = figure('Color','white');
set(fig,'defaultAxesColorOrder',[mycolor(5,:); mycolor(4,:)]);
%turn on
subplot(1,2,1)
hold on; box on; grid on;
set(gcf,'position',[100,100, 3.5*Width, 1.6*Width]);

yyaxis left;
plot(tt_d *1e3, Vds_d, 'color', mycolor(5,:), 'linewidth', LineWidth, 'linestyle', '--');
plot(tt_s *1e3-0.008, Vds_s, 'color', mycolor(5,:), 'linewidth', LineWidth, 'linestyle', '-');
ylabel('$V_{ds}$ (V)','fontname','Times New Roman','FontSize',14, 'Interpreter','latex'),
ylim([-50 400]);
yyaxis right;
plot(tt_d *1e3, Id_d, 'color', mycolor(4,:), 'linewidth', LineWidth, 'linestyle', '--');
plot(tt_s *1e3-0.008, Id_s*1.1, 'color', mycolor(4,:), 'linewidth', LineWidth, 'linestyle', '-');
ylabel('$I_{d}$ (A)','fontname','Times New Roman','FontSize',14, 'Interpreter','latex');

xlabel('Time ($\mu s$)','fontname','Times New Roman','FontSize',14, 'Interpreter','latex');
%legend({'Vds ED', 'Vds SPICE', 'Id ED', 'Id SPICE'},'fontname','Times New Roman','location','best');

xlim([152.7 152.9]);


%turn off
subplot(1,2,2);
hold on; box on; grid on;
set(gcf,'position',[100,100, 3.5*Width,1.6*Width]);
yyaxis left;
% xlim([158.6 158.9])


plot(tt_d3 *1e3, Vds_d3, 'color', mycolor(5,:), 'linewidth', LineWidth, 'linestyle', '--');
plot(tt_s *1e3-0.005, Vds_s, 'color', mycolor(5,:), 'linewidth', LineWidth, 'linestyle', '-');
ylabel('$V_{ds}$ (V)','fontname','Times New Roman','FontSize',14, 'Interpreter','latex'),
ylim([-50 400]);
yyaxis right;
plot(tt_d3 *1e3, Id_d3, 'color', mycolor(4,:), 'linewidth', LineWidth, 'linestyle', '--');
plot(tt_s *1e3-0.005, Id_s*1.2, 'color', mycolor(4,:), 'linewidth', LineWidth, 'linestyle', '-');
ylabel('$I_{d}$ (A)','fontname','Times New Roman','FontSize',14, 'Interpreter','latex');

xlabel('Time ($\mu s$)','fontname','Times New Roman','FontSize',14, 'Interpreter','latex');
%legend({'Vds ED', 'Vds SPICE', 'Id ED', 'Id SPICE'},'fontname','Times New Roman','location','best');

xlim([158.6 158.9]);