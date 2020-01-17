% ���������� Discrete Design ����Ʈ ���� �ڵ�
% Sampling Time = 1 sec���� �����Ѵ�
clear all; clc;

s = tf('s');
z = tf('z',1);
Gs = 1/(s*(10*s+1));
Ds = (10*s+1)/(s+1);
Gz = c2d(Gs,1);
DGs = Ds * Gs;
cDGs = feedback(DGs,1);

% Gz�� pole�� zero�� �˱����� �ڵ�
pole(Gz)
zero(Gz)
rlocus(Gz)

% zeta = 0.5 , Wn =1�� �ǹ��Ѵ� (���� ���������κ��� ���´�)
zgrid(0.5,1);

% =============== Lead Compensator 1 ���� =======================
% Dz Lead Compensator�� �����ϱ� ���� Pole ���� ���ϴ� �ڵ�
% z = exp(-s*Ts)�� ���踦 �̿��Ѵ�
newpole = exp(-1*1);
Dz = (z-0.9048)/(z-0.3679);
DGz = Dz *Gz;
rlocus(DGz)
zgrid(0.5,1);


% =============== Lead Compensator 2 ���� =======================
Dz2 = (z-0.9048)/(z+0.1);
DGz2 = Dz2 * Gz;
rlocus(DGz2)
zgrid(0.5,1);


% =============== Lead Compensator 3 ���� =======================
Dz3 = (z-0.8)/(z-0.05);
DGz3 = Dz3 * Gz;
rlocus(DGz3)
zgrid(0.5,1)
% k = 6 �̶�� ���� �������Ƿ� �����ش�
k = 6;
KDGz3 = DGz3 * k;
cKDGz3 = feedback(KDGz3,1);
step(cKDGz3,cDGs,15)


% =============== Lead Compensator 4 ���� =======================
Dz4 = (z-0.88)/(z+0.5);
DGz4 = Dz4 * Gz;
rlocus(DGz4)
zgrid(0.5,1);
% k2 = 13 �̶�� ���� �������Ƿ� �����ش�
k2 = 13;
KDGz4  = DGz4 * k2;
cKDGz4 = feedback(KDGz4,1);
step(cKDGz4,cDGs,15);

