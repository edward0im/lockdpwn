% ���������� Discrete Equivalent Design ����Ʈ ���� �ڵ�

clear all, clc;

s = tf('s');

Gs = 1/(s*(s+1));
Ds = 10*(s/2 + 1)/(s/10+1);
DGs = Gs*Ds;

% Wbw (�뿪���ļ�)�� ã�� ���� �ڵ�
% Wbw�� ��� Wcpm�� 2��� �Ѵٰ� �Ѵ�
% Ws (���ø����ļ�)�� Wbw�� 25�� �̻��� ���ٰ� �Ѵ�

%bode(DGs);
CGs = feedback(Gs,1);
%bode(CGs);
bandwidth(CGs);

CDGs = feedback(DGs,1);
bandwidth(CDGs);
%bode(CDGs);

[Gm,Pm,Wcg,Wcp] = margin(DGs);

% Wbw = 2 * Wcpm���� �����Ѵ�
% Ws�� 25 * Wbw�� �����Ѵ�
250/2/pi;
Ts = 1/(250/2/pi);

% �̻� ���� �����Ѵ�
tustinDd = c2d(Ds,Ts,'tustin')
zohDd = c2d(Ds,Ts,'zoh')

