% matlab ==> ���������� �׸��� �ڵ�
clear,clc;

% ���� ����
Mv = 1000;  % �������� kg
M1 = 150;   % ���繰���� kg
Ur = 0.015; % �������װ��
theta = atan(0.05); % ���θ���� (������ 5%)

v1 = 60;      % 1��      % �����ӵ� km/h
v2 = 130;     % 2��

Mf1 = 1.4;  % �������
Mf2 = 1.23;
Mf3 = 1.1;

Af = 1.71;  % ���������� m^2
Cd = 0.35;  % �������װ��
Rho = 1.2; % ����е� kg/m^3
a = 0.5; % �������ӵ� m/s^2
g = 9.81;   % �߷°��ӵ� m/s^2

% �ʱ����� ����
v = 1:1:180;

% Rolling Resistance
Rr = Ur * (Mv + M1) * g * cos(theta) + v * 0;

% Gradient Resistance
Rg = (Mv + M1) * g * sin(theta) + v* 0;

% Drag Resistance
Rd = Cd * Af * Rho/2 * (v/3.6).^2;  %   .  <== �̰� �ٿ�����Ѵ�. 
                                                % 3.6�� km/h ==> m/s�� ������ ���� ����Ѵ�
% Acceleration Resisntace
Ra =  zeros(1,180);

% �ӵ��� ���� ��������� �ٸ��� ����ؼ� Ra ���� ���մϴ�
for vt = 1:1:180
    if vt < 60
        Ra(1,vt) = Mf1*(Mv + M1) * a;
    
    elseif 60 <= vt  && vt <= 130
        Ra(1,vt) = Mf2* (Mv + M1) *a;
        
    else
        Ra(1,vt) = Mf3 * (Mv + M1) *a;
    end
end

% �׷����� ���ÿ� 4�� �׸��� 
hold on;
plot(v,Rr,'r','LineWidth',2);
plot(v,Rg + Rr,'g','LineWidth',2);
plot(v,Rd + Rg + Rr,'b','LineWidth',2);
plot(v,Ra + Rd + Rg + Rr,'c','LineWidth',2);

% ���ָ� �����մϴ�
legend('Rr','Rr + Rg','Rr + Rg + Rd','Rr + Rg + Rd + Ra');

% �׷��� ���� �̸��� �����մϴ�
grid;
title('Total Driving Resistance','fontsize',15);
xlabel('Velocity (m/s)','fontsize',15);
ylabel('Resistance (N)','fontsize',15);









