%{
    matlab ==> AEB (TTC_min based)�� ������ �� �ڵ�
               "A Study and Analysis for Calculating the Brake-application Time of AEB Systems Considering the Gradient" ���� ������ ����ȭ�غô�
                ���� ������ TTC �ڵ尡 �ƴ϶� TTC_min�� �߰��ؼ� TTC < TTC_min�� ��� AEB�� �۵��ϴ� ����̴� 
%}
clear, clc;

t = 0:0.1:10; % 1~10�� [s]
a_max = -8;   % �ִ밨���ӵ� [m/s^2]
v0 = 10;      % �ʱ�ӵ�(=���ӵ�) [m/s]
vrel = 10;    % ���ӵ� [m/s]
L = 10;       % ��ǥ�Ÿ� [m]

Smin = v0*t + 0.5 * a_max * t.^2;  % Smin = Minimum Deceleration Distance
Srel = L - Smin;                   % Srel = L - Smin���� ���

TTC_min = Smin / vrel;   % TTC_min ����
TTC = Srel / vrel;       % TTC�� ����

plot(TTC - TTC_min)  % plot�غ��� TTC < TTC_min �̾���ϹǷ� TTC - TTC_min < 0 �϶��� AEB�� �����Ѵ�
grid; axis([0 40 -10 10]);