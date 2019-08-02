% Load matfile %
load('Matrix.mat')

% % ����� ���� %
Q1 = 10;        % Lateral Offset �� ����ġ
Q2 = 30;        % Drift Angle�� ����ġ
R =  50;       % Steering Angle�� ����ġ
PL = [-50-50i,-50+50i,-30,-20]; % Observer ����

[K,L] = sfGain(Q1,Q2,R,PL);