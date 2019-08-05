
Ts =0.001;  % Sampling Time : 0.001 
s= tf('s');
z = tf('z',Ts);  

aa = (0.01272*z + 0.01203)/(z^2 - 1.8349*z + 0.8597);
bb = feedback(aa,1);

% bb��l Step���� �׽�Ʈ
step(bb,0.1)

% bb�� Ramp���� �׽�Ʈ 
step(bb/(1-z^-1),1/(1-z^-1),0.1);







