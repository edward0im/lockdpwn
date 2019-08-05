% matlab ==> excel �����͸� �о�� plot�ϴ� �ڵ�
%                   �����ϸ鼭 �ȱ��� �������� ������ȭ �ߴ�
clear,clc

% excel �����͸� �о�ɴϴ�
filename = 'data.xlsx';
sheet = 1;

% ������ ���� ������
xlRange = 'A2:A8500';
ylRange = 'B2:B8500';

% �����͸� �޾Ƽ�
x = xlsread(filename,sheet,xlRange);
x = -x';
y = xlsread(filename,sheet,ylRange);
y =y';

% �׷����� �׸��ϴ�
subplot(1,2,2);
plot(x,y,'bo'),grid
title('Right eye tracking','fontsize',15);
xlabel('m','fontsize',15);
ylabel('m','fontsize',15);

% ���� ���� ������
xlRange2 = 'C2:C8500';
ylRange2 = 'D2:D8500';

% �����͸� �޾Ƽ�
a = xlsread(filename,sheet,xlRange2);
a = -a';
b = xlsread(filename,sheet,ylRange2);
b =b';

% �׷����� �׸��ϴ�
subplot(1,2,1);
plot(a,b,'ro'),grid
title('Left eye tracking','fontsize',15);
xlabel('m','fontsize',15);
ylabel('m','fontsize',15);