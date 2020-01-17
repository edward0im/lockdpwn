% ���������� ���� Assignment2 ����Ʈ�� �ڵ�
%{
        �����ǥ
        Tr = 0.016s  <==> Wn = 112.5 rad/s
        Ts = 0.06s   <==> sigma = 76.6
        Mp = 4%     <==> zeta = 0.71
        ess = 0%
%}
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
%step(my_motor)

%{ 
pdf�� ���� reference motor�� ����
http://ctms.engin.umich.edu/CTMS/index.php?example=MotorPosition&section=ControlPID
�� Ȩ������ ���� �״�� �ο��ߴٰ� �Ѵ�

Jrefer = 0.01;
brefer = 0.1;
Lrefer =  0.5;
Rrefer =  1;
Krefer = 0.01;

refer_motor = Krefer/(s*((Jrefer*s+brefer)*(Lrefer*s+Rrefer)+Krefer^2));  
step(refer_motor)
%}

%==============================================================
% P ����� : Kp ã�� ----------------------------------------------
Kp = 3;
for i = 1:3
    C(:,:,i) = pid(Kp);
    Kp = Kp +0.5;
end
sys_cl = feedback(C*my_motor,1);

t = 0:0.001:0.2;
step(sys_cl(:,:,1), sys_cl(:,:,2), sys_cl(:,:,3), t)
ylabel('Position, \theta (radians)')
title('Response to a Step Reference with Different Values of K_p','fontsize',20)
legend('K_p = 3',  'K_p = 3.5',  'K_p =4')

% �ܶ� ���ϱ�
dist_cl = feedback(my_motor,C);
step(dist_cl(:,:,1), dist_cl(:,:,2), dist_cl(:,:,3), t)
ylabel('Position, \theta (radians)')
title('Response to a Step Disturbance with Different Values of K_p','fontsize',20)
legend('K_p = 3', 'K_p = 3.5','K_p = 4')


%==============================================================
% PI ����� : Ki ã�� ----------------------------------------------
Kp = 4;
Ki = 2.5;
for i = 1:3
    C(:,:,i) = pid(Kp,Ki);
    Ki = Ki + 5;
end
sys_cl = feedback(C*my_motor,1);
t = 0:0.001:8;
step(sys_cl(:,:,1), sys_cl(:,:,2), sys_cl(:,:,3), t)
ylabel('Position, \theta (radians)')
title('Response to a Step Reference with K_p = 4 and Different Values of K_i','fontsize',20)
legend('K_i = 2.5', 'K_i = 7.5', 'K_i = 12.5')

% �ܶ� ���ϱ�
dist_cl = feedback(my_motor,C);
t = 0:0.001:8;
step(dist_cl(:,:,1), dist_cl(:,:,2), dist_cl(:,:,3), t)
ylabel('Position, \theta (radians)')
title('Response to a Step Disturbance with K_p = 4 and Different Values of K_i','fontsize',20)
legend('K_i = 2.5', 'K_i = 7.5', 'K_i = 12.5')




%==============================================================
% PID ����� : Kd ã�� ----------------------------------------------
Kp = 4;
Ki = 2.5;
Kd = 0.012;
for i = 1:3
    C(:,:,i) = pid(Kp,Ki,Kd);
    Kd = Kd + 0.5;
end

sys_cl = feedback(C*my_motor,1);
t = 0:0.001:.3;
step(sys_cl(:,:,1), sys_cl(:,:,2), sys_cl(:,:,3), t)
ylabel('Position, \theta (radians)')
title('Response to a Step Reference with K_p = 4, K_i = 2.5 and Different Values of K_d','fontsize',20)
legend('K_d = 0.012', 'K_d = 0.512', 'K_d = 1.012')

% �ܶ� ���ϱ�
dist_cl = feedback(my_motor,C);
t = 0:0.001:8;
step(dist_cl(:,:,1), dist_cl(:,:,2), dist_cl(:,:,3), t)
ylabel('Position, \theta (radians)')
title('Response to a Step Disturbance with K_p = 4, K_i = 2.5 and Different values of K_d','fontsize',20)
legend('K_d = 0.012', 'K_d = 0.512', 'K_d = 1.012')


stepinfo(sys_cl(:,:,2))

% �������� PID ���� �ڵ�
Ds = pid(4,2.5,0.012);
DGs = Ds * my_motor;
step(DGs);
clDGs = feedback(DGs,1);
step(clDGs)
distDGs = feedback(my_motor,Ds);
step(distDGs)
stepinfo(distDGs)


%==============================================================
% root locus -----------------------------------------------------

clear,clc

s = tf('s');

J = 52E-7;        % �����������Ʈ [ kg * m^2 ]
b = 3.1831E-4;   % ����������� [ Nm*s/rad ]  % pdf�� Speed Regulation Constant�� ���� ��´� % 3.141e-03
K = 0.0245;       % Kt ,��ũ��� [ Nm/A ] 
                      % Ke ,�������»�� [ V*s/rad ] ���� ��� ���� ������ �Ѵ� 
R = 1.8;           % ������ �������� [ Ohm ]
L = 0.0024;       % ������ �δ��Ͻ� [ H ]

% ������ �и� 2���������̳� 
% ���ӵ�(theta') ==> ����(theta)�� output�� �ٲ�鼭 �������·� 1/s�� �߰��Ǿ� 3�������� ���°� �ȴ�.
%Kp = 44.8;
my_motor = K/(s*((J*s+b)*(L*s+R)+K^2));
rlocus(my_motor)


% �������� Root Locus ���� �ڵ� (�ܶ��� ���� ���踦 �ٽ��ؾ� �Ѵ�)
K = 7.56;
Ds2 = (s+140.1)/(s+190);
Ds3 = (s+671.14)/(s+1000);
DGs2 = my_motor * K * Ds2 * Ds3;
clDGs2 = feedback(DGs2,1);
step(clDGs2)
stepinfo(clDGs2)
distDGs2 = feedback(my_motor,K*Ds2*Ds3);
step(distDGs2)



%==============================================================
% bode plot design -----------------------------------------------------

clear,clc

s = tf('s');

J = 52E-7;        % �����������Ʈ [ kg * m^2 ]
b = 3.1831E-4;   % ����������� [ Nm*s/rad ]  % pdf�� Speed Regulation Constant�� ���� ��´� % 3.141e-03
K = 0.0245;       % Kt ,��ũ��� [ Nm/A ] 
                      % Ke ,�������»�� [ V*s/rad ] ���� ��� ���� ������ �Ѵ� 
R = 1.8;           % ������ �������� [ Ohm ]
L = 0.0024;       % ������ �δ��Ͻ� [ H ]

% ������ �и� 2���������̳� 
% ���ӵ�(theta') ==> ����(theta)�� output�� �ٲ�鼭 �������·� 1/s�� �߰��Ǿ� 3�������� ���°� �ȴ�.
%Kp = 44.8;
my_motor = K/(s*((J*s+b)*(L*s+R)+K^2));


% Gain Margin, Phase Margin, Wcp,Wcg�� ���Ѵ�
[Gm,Pm,Wcg,Wcp] = margin(my_motor);
% bode plot�� Ȯ���Ѵ�
bode(my_motor)


%{
 �츮�� �ý��۸�ǥ�� 
    ess = 0
    Mp = 4%  ==> zeta = 0.715 ==> PM = 71.5
    tr = 0.016s ==> Wn = 112.5 ==> Wcp = 112.5 �� �Ǿ�� �Ѵ�


    �켱 my_motor�� ���� Ramp �Է� ess�� ���� ��� 0.0478 (4.78%) �� ���´�
    ���� K ���� 100���� ���� ess �� 0���� �����ϰ� �Ѵ�
    
%}

% �������� Bode ���� �ڵ� (�ܶ��� ���� ���踦 �ٽ��ؾ� �Ѵ�)

% Gs�� ess(ramp)�� ���ϱ� ���� �ڵ�
clGs = feedback(my_motor,1);
E = (1-clGS);
syms s;
double(limit( s/s^2 *(1.248e-8*s^3 + 1.012e-5*s^2 + 0.001173*s)/(1.248e-8*s^3 + 1.012e-5*s^2 + 0.001173*s + 0.0245)  ,s,0))
% Gs�� ess(ramp)�� 0.0479�� ���� Ȯ���߰� K=100�� �־� ess�� 0�� �����ϰ� �ߴ�
K2 = 100;
double(limit( s/s^2 *(1.248e-8*s^3 + 1.012e-5*s^2 + 0.001173*s)/(1.248e-8*s^3 + 1.012e-5*s^2 + 0.001173*s + 0.0245* K2)  ,s,0))

Ds4 = (1+s/478.14)/(1+s/47814);
DGs3 = K2 * my_motor * Ds4 * Ds4;
clDGs3 = feedback(DGs3,1);
step(clDGs3)
distDGs3 = feedback(DGs3, K2 * Ds4 * Ds4);
step(distDGs3)


