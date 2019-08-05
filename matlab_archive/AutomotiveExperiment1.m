% �ڵ������ս���2 
% Powertrain �������� ���´ܼ��� ���� Wet Clutch�� Torque Transfer �ŵ� ���� �ڵ�

% ���������ͷ� ���� ���� �������� �޴´�

%{
        tt : 1.5�ʺ��� 1.9�ʱ��� �ִ� 28800���� �ð� ������
        applyforce : �ð������Ϳ� ���� applyforce ������
        engageT : �ð������Ϳ� ���� engageT ������
        mu : ������ ���� ���� �����°��
        
        (�Ʒ��� ������ �ʿ��� ������)
        t
        drivespeed
        t2
        drivenspeed
%}


%=========================== CASE 1 ==================================
% �׷���1 �ð�-��ũ
plot(tt,engageT,'linewidth',2),grid
xlabel('time [s]','fontsize',25);
ylabel('Engagement Torque [Nm]','fontsize',25);
title('Engagement Torque - Time [1500RPM, 20deg, 500cc, 4000N]','fontsize',25);

% drive,driven speed ������ �ϱ����� TT�� �����Ѵ�
TT = linspace(1.5,2.0,28801);
interpdrivespeed = interp1(t,drivespeed,TT,'pchip');
interpdrivenspeed = interp1(t2,drivenspeed,T,'pchip');

% ��� RPM�� ���Ѵ�
for i = 1:28801
relativeRPM(i) = interpdrivespeed(i) - interpdrivenspeed(i);
end

% �׷���2 �ð��� ���� Ŭ��ġ�� RPM 
plot(TT,interpdrivespeed,TT,interpdrivenspeed,'linewidth',2)
xlabel('time [s]','fontsize',25);
ylabel('RPM [rev/min]','fontsize',25);
title('RPM - Time [1500RPM, 20deg, 500cc, 4000N]','fontsize',25);grid

% �׷���3 �ð��� ���� ��� RPM
plot(TT, relativeRPM,'r','linewidth',2);grid
xlabel('time [s]','fontsize',25);
ylabel('Relative RPM [rev/min]','fontsize',25);
title('Relative RPM - Time [1500RPM, 20deg, 500cc, 4000N]','fontsize',25);

% �׷���4 ��� RPM�� ���� mu ���� ��ȭ �׷���
plot(relativeRPM,mu,'c','linewidth',2);grid
xlabel('Relative RPM [rev/min]','fontsize',25);
ylabel('Friction Coefficient','fontsize',25);
title('Friction Coefficient - Relative RPM [1500RPM, 20deg, 500cc, 4000N]','fontsize',25);
axis([-10 100 -1 1])
















%=========================== CASE 2 ==================================
% �׷���1 �ð�-��ũ
plot(tt,engageT,'linewidth',2),grid
xlabel('time [s]','fontsize',25);
ylabel('Engagement Torque [Nm]','fontsize',25);
title('Engagement Torque - Time [900RPM, 20deg, 500cc, 4000N]','fontsize',25);

% drive,driven speed ������ �ϱ����� TT�� �����Ѵ�
TT = linspace(1.5,2.0,28801);
interpdrivespeed = interp1(t,drivespeed,TT,'pchip');
interpdrivenspeed = interp1(t2,drivenspeed,TT,'pchip');

% ��� RPM�� ���Ѵ�
for i = 1:28801
relativeRPM(i) = interpdrivespeed(i) - interpdrivenspeed(i);
end

% �׷���2 �ð��� ���� Ŭ��ġ�� RPM 
plot(TT,interpdrivespeed,TT,interpdrivenspeed,'linewidth',2)
xlabel('time [s]','fontsize',25);
ylabel('RPM [rev/min]','fontsize',25);
title('RPM - Time [900RPM, 20deg, 500cc, 4000N]','fontsize',25);grid

% �׷���3 �ð��� ���� ��� RPM
plot(TT, relativeRPM,'r','linewidth',2);grid
xlabel('time [s]','fontsize',25);
ylabel('Relative RPM [rev/min]','fontsize',25);
title('Relative RPM - Time [900RPM, 20deg, 500cc, 4000N]','fontsize',25);

% �׷���4 ��� RPM�� ���� mu ���� ��ȭ �׷���
plot(relativeRPM,mu,'c','linewidth',2);grid
xlabel('Relative RPM [rev/min]','fontsize',25);
ylabel('Friction Coefficient','fontsize',25);
title('Friction Coefficient - Relative RPM [900RPM, 20deg, 500cc, 4000N]','fontsize',25);
axis([-10 100 -1 1])








%=========================== CASE 3 ==================================
% �׷���1 �ð�-��ũ
plot(tt,engageT,'linewidth',2),grid
xlabel('time [s]','fontsize',25);
ylabel('Engagement Torque [Nm]','fontsize',25);
title('Engagement Torque - Time [900RPM, 20deg, 500cc, 8000N]','fontsize',25);

% drive,driven speed ������ �ϱ����� TT�� �����Ѵ�
TT = linspace(1.3,1.7,28801);
interpdrivespeed = interp1(t,drivespeed,TT,'pchip');
interpdrivenspeed = interp1(t2,drivenspeed,TT,'pchip');

% ��� RPM�� ���Ѵ�
for i = 1:28801
relativeRPM(i) = interpdrivespeed(i) - interpdrivenspeed(i);
end

% �׷���2 �ð��� ���� Ŭ��ġ�� RPM 
plot(TT,interpdrivespeed,TT,interpdrivenspeed,'linewidth',2)
xlabel('time [s]','fontsize',25);
ylabel('RPM [rev/min]','fontsize',25);
title('RPM - Time [900RPM, 20deg, 500cc, 8000N]','fontsize',25);grid

% �׷���3 �ð��� ���� ��� RPM
plot(TT, relativeRPM,'r','linewidth',2);grid
xlabel('time [s]','fontsize',25);
ylabel('Relative RPM [rev/min]','fontsize',25);
title('Relative RPM - Time [900RPM, 20deg, 500cc, 8000N]','fontsize',25);

% �׷���4 ��� RPM�� ���� mu ���� ��ȭ �׷���
plot(relativeRPM,mu,'c','linewidth',2);grid
xlabel('Relative RPM [rev/min]','fontsize',25);
ylabel('Friction Coefficient','fontsize',25);
title('Friction Coefficient - Relative RPM [900RPM, 20deg, 500cc, 8000N]','fontsize',25);
axis([-10 300 -1 1])















