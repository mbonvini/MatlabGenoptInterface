% Author: MArco Bonvini
% date: 17/06/2011
%
% Here you can try the parameters obtained with GenOPT
% just replace with the values computed by the optimization procedure

% S-Laplace operator
s = tf('s');

% parameters of the simulation
Tstep = 0.1;
Tstart = 0;
Tstop = 250;
time = Tstart:Tstep:Tstop;
% parameters of the cost function
C_w = diag(0.5:-(0.5-0.01)/2500:0.01);
Q = diag(10:-(10-1)/2500:1);
% parameters of the process to be controlled
T1 = 10;
T2 = 50;
% reference trajectory (desired one)
y_ref = 1 - exp(-time/8);

% parameters computed with GenOpt -- TO BE SUBSTITUTED --
Ti = 49.29;
K = 6.13;

% process, controller, Closed-Loop transfer functions 
P = 1/(1+s*T1)/(1+s*T2);
PI = K*(1+s*Ti)/(s*Ti);
L = P*PI;

% Step response of the closed loop control system
[Y T] = step(L/(1+L),time);

[Y_P T] = step(P,time);

% computing the cost function associated
cost = (y_ref-Y')*Q*(y_ref-Y')' + (Y'*C_w*Y)

% Plot the reference trajectory and the obtained one
% the green one is the desired, the red one is the one obtained with the controller action
plot(time,y_ref,'g',time,Y_P,'ob',time,Y,'+r')
