function [K,L] = state_feedback_Gain(Q1,Q2,R,PL)

global A B

% LKAS State-Space model
C = [1, 0, 0, 0];
D = 0;

% LQR Weighted Matrix
Q = diag([Q1,1,Q2,1]);

% State Feedback Gain
K = lqr(A,B,Q,R);     % lqr�� ����ؼ� K ������ ���� �� �ְ� Pole�� ����ؼ� acker()�Լ��� ���� ���� �ִ�
L = place(A',C',PL);  % place() ��� acker() �Լ��� ����ص� ����� ���� ���´�

end