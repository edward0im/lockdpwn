%{
    matlab ==> ĸ����2, LKAS + State Feedback �ý����� ������ ���� ������ �ڵ�
                        LQR�� ����� K�� L ���� ���ؾ��Ѵ� 
%}
%% Load matfile %
load('Matrix.mat')
load('PathData.mat')

%% ������ �ʱ� ��ġ �� �ӵ� ���� %
X0 = 25;            % �ʱ� X��ǥ [m]
Y0 = 0.00138;       % �ʱ� Y��ǥ [m]
psi0 = -0.6*pi/180; % �ʱ� ���� [rad]
Vx0 = 100;          % �ʱ� �ӵ� [km/h]
tf = 30;            % �ùķ��̼� �ð� [s]

%% LQR ����� ���� %
Q1 = 5;        % Lateral Offset �� ����ġ
Q2 = 30;        % Drift Angle�� ����ġ
R =  250;       % Steering Angle�� ����ġ
% �� Q1,Q2�� �밢��� Q�� ����� R�� ���ؼ� LQR�� ����� State Feedback K ����� ���ϴµ��ϴ�

PL = [-50-50i,-50+50i,-30,-20]; % Observer ����

[K,L] = state_feedback_Gain(Q1,Q2,R,PL);

% K = [ 0.1414    0.0116    0.7936    0.0449 ]         �� ������
% L = 1e+03 * [ 0.1060    5.4698    1.3335    0.9096 ] �� ���´�




