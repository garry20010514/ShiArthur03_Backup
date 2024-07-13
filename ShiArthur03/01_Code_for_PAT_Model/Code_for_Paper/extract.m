a1=[0.0159998];
a2=0.016000240000000;

t1=get(obj(2), 'xdata');
y1=get(obj(2), 'ydata');

t11=find(t1>a1&t1<a2);
t1=t1(t11(1):t11(end));t1=t1';
y1=y1(t11(1):t11(end));y1=y1';

yyaxis left
obj = get(gca,'children')