% matlab ==> excel �����͸� �о�� plot�ϴ� �ڵ�2
%                  GSR gavalnic skin reflex
%                  PPI pulse to pulse inverval
clear,clc

% excel �����͸� �о�ɴϴ�
filename = 'data.xlsx';
sheet = 1;

xlRange = 'F2:F8500';
ylRange = 'G2:G8500';

% excel�κ��� GSR, PPI ���� �Ѱܹ޽��ϴ�
gsr = xlsread(filename,sheet,xlRange);
gsr = gsr';

ppi = xlsread(filename,sheet,ylRange);
ppi = ppi';

% �ð��� �����ϰ�
t = 1:8499;

% �׷����� �׸��ϴ�
subplot(2,1,1);
plot(t,gsr,'r'),grid
title('GSR, Galvalnic Skin Reflex','fontsize',15);
xlabel('total time : 272.32s','fontsize',15);
ylabel('mV','fontsize',15);

subplot(2,1,2);
plot(t,ppi,'m'),grid
title('PPI, Pulse to Pulse Interval','fontsize',15);
xlabel('total time : 272.32s','fontsize',15);
ylabel('RR interval(s)','fontsize',15);