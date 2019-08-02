clear all
close all
clc

% Load matfile %
load('Matrix.mat')
load('PathData.mat')

% ������ �ʱ� ��ġ �� �ӵ� ���� %
X0 = 25;            % �ʱ� X��ǥ [m]
Y0 = 0.00138;       % �ʱ� Y��ǥ [m]
psi0 = -0.6*pi/180; % �ʱ� ���� [rad]
Vx0 = 120;          % �ʱ� �ӵ� [km/h]
tf = 30;            % �ùķ��̼� �ð� [s]

% % ����� ���� %
Q1 = 10;        % Lateral Offset �� ����ġ
Q2 = 30;        % Drift Angle�� ����ġ
R =  250;       % Steering Angle�� ����ġ
PL = [-50-50i,-50+50i,-30,-20]; % Observer ����

[K,L] = sfGain(Q1,Q2,R,PL);

% �ùķ��̼� %
[tout,xout,yout] = sim('LKS_Curve.slx');

% ��� Plot %
deltaf =yout(:,1);                  % ������ ���Ⱒ [rad]
Vx =yout(:,2);                      % ������ �ӵ� [m/s]
Vy =yout(:,3);                      % Ⱦ���� �ӵ� [m/s]
gamma =yout(:,4);                   % �䷹��Ʈ [rad/s]
X =yout(:,5);                       % X��ǥ [m]
Y =yout(:,6);                       % Y��ǥ [m]
psi =yout(:,7);                     % ����� [rad]
LO = yout(:,8);                     % Lateral Offset [m]
scale = 5;                       % Animate�� ���� ũ��
nframe = 100;                    % Animate�� frame��
imanual = 0;                     % Auto = 0 / manual = 1

anim_tracking(P,Vx,X,Y,psi,LO,tout,scale,deltaf,nframe,imanual)