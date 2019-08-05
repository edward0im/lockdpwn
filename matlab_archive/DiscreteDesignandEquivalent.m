% ���������� ���� Assignment3 ����Ʈ�� �ڵ�
%{
        �����ǥ
        Tr = 0.016s  <==> Wn = 112.5 rad/s
        Ts = 0.06s   <==> sigma = 76.6
        Mp = 4%     <==> zeta = 0.71
        ess = 0.001 for a ramp input
%}

% =============== �̻� (Discrete Equivalent) ����  ======================
clear,clc;

s = tf('s');

J = 52E-7;        % �����������Ʈ [ kg * m^2 ]
b = 3.1831E-4;   % ����������� [ Nm*s/rad ]  % pdf�� Speed Regulation Constant�� ���� ��´� % 3.141e-03
K = 0.0245;       % Kt ,��ũ��� [ Nm/A ] 
                      % Ke ,�������»�� [ V*s/rad ] ���� ��� ���� ������ �Ѵ� 
R = 1.8;           % ������ �������� [ Ohm ]
L = 0.0024;       % ������ �δ��Ͻ� [ H ]

% ������ �и� 2���������̳� 
% ���ӵ�(theta') ==> ����(theta)�� output�� �ٲ�鼭 �������·� 1/s�� �߰��Ǿ� 3�������� ���°� �ȴ�.
my_motor = K/(s*((J*s+b)*(L*s+R)+K^2));  
Gs = my_motor;

% �ڼ��� ������ Ȯ���� �ùĸ�ũ�� �����س���
Ds = pid(4,2.5,0.012);
DGs = Ds * Gs;

% ������ Ts�� ã�´� (Wcpm�� 2�谡 Wbw�̰� Wbw�� 25�谡 ������ Ts�̹Ƿ�
% Ts�� Wcpm�� 50�� ������ �� �� �ִ�.
[Gm,Pm,Wcg,Wcp] = margin(Gs)
Ws = 25*2 * Wcp;
fs = Ws / 2 / pi;
Ts = 1/fs;
Dz = c2d(Ds,Ts,'tustin');









% =============== �̻꼳�� (Discrete Design) ���ļ����� ����  ======================
%{
        Tr <= 0.016s  <==> Wn >= 112.5 rad/s  <==>  Wcpm >= 112.5 rad/s
        Ts <= 0.06s   <==> sigma >= 76.6           
        Mp <= 4%     <==> zeta >= 0.71         <==>  PM >= 71'
        ess = 0.001 for a ramp input                <==>   Kv >= 1000  
%}
clear all, clc;

s = tf('s');

J = 52E-7;        % �����������Ʈ [ kg * m^2 ]
b = 3.1831E-4;   % ����������� [ Nm*s/rad ]  % pdf�� Speed Regulation Constant�� ���� ��´� % 3.141e-03
K = 0.0245;       % Kt ,��ũ��� [ Nm/A ] 
                      % Ke ,�������»�� [ V*s/rad ] ���� ��� ���� ������ �Ѵ� 
R = 1.8;           % ������ �������� [ Ohm ]
L = 0.0024;       % ������ �δ��Ͻ� [ H ]


% ������ �и� 2���������̳� 
% ���ӵ�(theta') ==> ����(theta)�� output�� �ٲ�鼭 �������·� 1/s�� �߰��Ǿ� 3�������� ���°� �ȴ�.
my_motor = K/(s*((J*s+b)*(L*s+R)+K^2));  
Gs = my_motor;

% Samplng Time ��� Wcp�� 2�谡 Wbw�̰� Ws�� Wbw�� 25���̴� (�� 50��)
[Gm,Pm,Wcg,Wcp] = margin(Gs);
Ws = 25 * 2 * Wcp;
fs = Ws / 2 / pi;
Ts = 1/fs;

z = tf('z',Ts);

Gz = c2d(Gs,Ts,'zoh');
bode(Gz)
[Gm,Pm,Wcg,Wcp] = margin(Gz)


% (skip�ص���) Gs�� ess(for a ramp input)�� ���ϱ� ���� �ڵ�
syms y;
Gy= (1.248e-8*y^3 + 1.012e-5*y^2 + 0.001173*y)/(1.248e-8*y^3 + 1.012e-5*y^2 + 0.001173*y + 0.0245);
double(limit(y/y^2*Gy,y,0));
% Gs�� ess(ramp)�� 0.0479�� ���� Ȯ���߰� K=100�� �־� ess�� 0�� �����ϰ� �ߴ�
K = 100;
double(limit(y/y^2*Gy/K,y,0));



%{ 
    DGz�� ess(ramp)�� ���ϱ� ���� �ڵ�
    ess = 0.001, r(t) = t �� ��� Kv >= 1000 �̾�� �Ѵ�
    Gz = ((z+1.4903)*(z+0.0627))/((z-1)*(z-0.4263)*(z-0.0168)) �̴�.
    Dz�� Bode plot���� ��� ���غ���
%} 


% 1�� �õ� Dz --------------------------------
Dz = (z-0.9048)/(z-0.3679);
DGz = Dz * Gz;

% Kv �� ��� >= 1000 
syms x;
Dx = (x-0.9048)/(x-0.3679);
Gx = ((x+1.4903)*(x+0.0627))/((x-1)*(x-0.4263)*(x-0.0168));
K = 1;
double(limit(((x-1)/Ts)*K*Dx*Gx,x,1))

K = 8.6207;
bode(K*DGz)
[Gm,Pm,Wcg,Wcp] = margin(K*DGz)
% result : PM = 63 , Wcpm = 117.16



% 2�� �õ� Dz --------------------------------
Dz2 = (z-0.9048)/(z);
DGz2 = Dz2 * Gz;

% Kv �� ��� >= 1000 
syms x;
Dx = (x-0.9048)/(x);
Gx = ((x+1.4903)*(x+0.0627))/((x-1)*(x-0.4263)*(x-0.0168));
K = 1;
double(limit(((x-1)/Ts)*K*Dx*Gx,x,1))

K = 13.62;
bode(K*DGz2)
[Gm,Pm,Wcg,Wcp] = margin(K*DGz2)
% result : PM = 59.3' , Wcpm = 154.95 rad/s




% 3�� �õ� Dz --------------------------------
Dz3 = (z-0.88)/(z+0.5);
DGz3 = Dz3 * Gz;

% Kv �� ��� >= 1000 
syms x;
Dx = (x-0.88)/(x+0.5);
Gx = ((x+1.4903)*(x+0.0627))/((x-1)*(x-0.4263)*(x-0.0168));
K = 1;
double(limit(((x-1)/Ts)*K*Dx*Gx,x,1))

K = 16.21;
bode(K*DGz3)
[Gm,Pm,Wcg,Wcp] = margin(K*DGz3)
% result : PM = 92.59', Wcpm = 117.79 rad/s






% =============== �̻꼳�� (Discrete Design) �ٱ����� ����  ======================
%{
        Tr <= 0.016s  <==> Wn >= 112.5 rad/s
        Ts <= 0.06s   <==> sigma >= 76.6
        Mp <= 4%     <==> zeta >= 0.71
        ess = 0.001 for a ramp input
        
        r = exp(-sigma*Ts)
 %}
clear all,clc;

s = tf('s');

J = 52E-7;        % �����������Ʈ [ kg * m^2 ]
b = 3.1831E-4;   % ����������� [ Nm*s/rad ]  % pdf�� Speed Regulation Constant�� ���� ��´� % 3.141e-03
K = 0.0245;       % Kt ,��ũ��� [ Nm/A ] 
                      % Ke ,�������»�� [ V*s/rad ] ���� ��� ���� ������ �Ѵ� 
R = 1.8;           % ������ �������� [ Ohm ]
L = 0.0024;       % ������ �δ��Ͻ� [ H ]

% ������ �и� 2���������̳� 
% ���ӵ�(theta') ==> ����(theta)�� output�� �ٲ�鼭 �������·� 1/s�� �߰��Ǿ� 3�������� ���°� �ȴ�.
my_motor = K/(s*((J*s+b)*(L*s+R)+K^2));  
Gs = my_motor;


% Samplng Time ��� Wcp�� 2�谡 Wbw�̰� Ws�� Wbw�� 25���̴� (�� 50��)
[Gm,Pm,Wcg,Wcp] = margin(Gs);
Ws = 25 * 2 * Wcp;
fs = Ws / 2 / pi;
Ts = 1/fs;

z = tf('z',Ts);

Gz = c2d(Gs,Ts,'zoh');

rlocus(Gz)
zgrid(0.71, 112.5*Ts)
r = exp(-76.6 * Ts);









