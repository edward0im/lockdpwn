%{
    matlab ==> ĸ����2, LKAS + State Feedback System�� �����ϱ� ����
                       ���°����� ����� 4x4�� ���¹����� ����� ���ϴ� �ڵ��̴�
%}

Caf = 72653;   % Front Cornering Stiffness
Car = 121449;  % Rear Cornering Stiffness
Lf = 1.170;    % from CG to Front Tire [m]
Lr = 1.77;     % from CG to Rear Tire  [m]  
m = 1820;      % mass of Vehicle [kg]
Iz = 3746;     % Yaw moment of Inertia
Vx = 19.44;    % Vehicle Longitudinal Velocity 

%%
% ���°��� ������� ����Ѵ�.  from paper "lateral dynamics'
a11 = -2*(Caf*Lf^2+Car*Lr^2)/(Iz*Vx);
a12 = 2*(Caf*Lf-Car*Lr)/Iz;
a13 = -2*(Caf*Lf-Car*Lr)/(Iz*Vx);
a31 = 2*(-Caf*Lf+Car*Lr)/(m*Vx);
a32 = 2*(Caf+Car)/m;
a33 = -2*(Caf+Car)/(m*Vx);

b11 = 2*Caf*Lf/Iz;
b31 = 2*Caf/m;

%%
% ���°�����  X' = AX + B
%             Y = CX + D  �� ���Ѵ�
A = [a11 a12 a13 0; 1 0 0 0; a31 a32 a33 0; 0 0 1 0];
B = [b11 0 b31 0]';
C = [0 0 0 1];
D = 0;


%%
P_K = [-4 -4 -8 -8];      % Pole for State Feedback
P_L = [-9 -9 -25 -25] ;     % Pole for Observer

K = acker(A, B, P_K); 
L = acker(A', C', P_L); 
L = L';





