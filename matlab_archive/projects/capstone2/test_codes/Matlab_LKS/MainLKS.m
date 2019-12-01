% Load matfile %
load('Matrix.mat')

% ������ �ʱ� ��ġ �� �ӵ� ���� %
X0 = 0;            % �ʱ� X��ǥ [m]
Y0 = 1;       % �ʱ� Y��ǥ [m]
psi0 = 0 * (pi/180); % �ʱ� ���� [rad]

% % ����� ���� %
Q1 = 10;        % Lateral Offset �� ����ġ
Q2 = 30;        % Drift Angle�� ����ġ
R =  5000;       % Steering Angle�� ����ġ
PL = [-50-50i,-50+50i,-30,-20]; % Observer ����

[K,L] = sfGain(Q1,Q2,R,PL);
