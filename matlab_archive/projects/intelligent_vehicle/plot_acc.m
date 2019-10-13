%{
    matlab ==> �������ڵ���, HW1 acc �� ���� �� ������ �Ÿ������� �����ϰ� �ϴ� �ڵ�
                                      �ٽ� �ڵ�� simulink acc_model_ed.mdl�� �ְ�
                                      �� �ڵ�� plot�� �ڵ��̴�
%}

%% ������ ������ trajectory plot
plot(tout, x_rear,'r', tout, x_front,'b-', 'LineWidth', 2); grid;
title('Front, Rear Vehicles Trajectory', 'FontSize', 15);
xlabel('Time','FontSize', 15);
ylabel('Trajectory (m)','FontSize', 15);
legend({'Rear', 'Front'}, 'FontSize', 15);



%% �� ���� �Ÿ����� plot
plot(tout, -x, 'LineWIdth', 2); grid;
title('Diff Distance between Two Vehicles', 'FontSize', 15);
xlabel('Time','FontSize', 15);
ylabel('Diff Distance (m)','FontSize', 15);
legend({'diff distance'}, 'FontSize', 15);