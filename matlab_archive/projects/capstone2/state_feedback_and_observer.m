%% ĸ���� ==> state feedback

clear;clc

A = [0 1; -3 -1];
B = [0 1]';
C = [1 0];
D = 0;

P = [-2+2j, -2-2j];  % system�� ����, �ӷ����Ҽ��̾�� �Ѵ�. �����ε�?
k = acker(A,B,P);   % acker() : A,B matrix�� �޾Ƽ� P matrix�� �����Ͽ� K matrix�� ��ȯ�Ѵ�

P1 = [-20+20j, -20-20j];  % observer�� ����. ���żӵ��� ������ϹǷ� <-- ���� LHP�� �־�� �Ѵ�
L = acker(A',C',P1);



%% 

% ���°���
ss_sys_b = ss(A,B,C,D);     % before
ss_sys_f = ss(A-B*k,B,C,D); % after

% ���°��� ==> �����Լ�
TF_B = tf(ss_sys_b)
TF_f = tf(ss_sys_f)

% step�� �־�� simulink �׷����� ������ Ȯ��
step(TF_f)


%%

ss_sys_o = ss(A-L'*C, B, C, D);

TF_O = tf(ss_sys_o)



%%

f = ctrb(A,B);   % controllability
rank(f)          % 2�̸� controllability �����Ѵ�

f = obsv(A,C);
rank(f)


