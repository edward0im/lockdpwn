% Load matfile %
load('Matrix.mat')
load('PathData.mat')

% ������ �ʱ� ��ġ �� �ӵ� ���� %
X0 = 25;            % �ʱ� X��ǥ [m]
Y0 = 0.00138;       % �ʱ� Y��ǥ [m]
psi0 = -0.6*pi/180; % �ʱ� ���� [rad]
Vx0 = 60;          % �ʱ� �ӵ� [km/h]
tf = 30;            % �ùķ��̼� �ð� [s]

% % ����� ���� %
Q1 = 5;        % Lateral Offset �� ����ġ
Q2 = 30;        % Drift Angle�� ����ġ
R =  250;       % Steering Angle�� ����ġ
PL = [-50-50i,-50+50i,-30,-20]; % Observer ����

[K,L] = sfGain(Q1,Q2,R,PL);

% �ùķ��̼� %
[tout,xout,yout] = sim('Bicycle_SCC_LKS.slx');

% ��� Plot %
Vx =yout(:,1);                      % ������ �ӵ� [m/s]
Vy =yout(:,2);                      % Ⱦ���� �ӵ� [m/s]
gamma =yout(:,3);                   % �䷹��Ʈ [rad/s]
X =yout(:,4);                       % X��ǥ [m]
Y =yout(:,5);                       % Y��ǥ [m]
psi =yout(:,6);                     % ����� [rad]
deltaf =yout(:,7);                  % ������ ���Ⱒ [rad]
scale = 5;                       % Animate�� ���� ũ��
nframe = 100;                    % Animate�� frame��
imanual = 0;                     % Auto = 0 / manual = 1

anim_tracking_SCC_LKS(P,Vx,X,Y,psi,tout,scale,deltaf,nframe,imanual)