% initialization script for Matlab
% Author: Marco Bonvini
% date: 17/06/2011

% parameters of the simulation
Tstep = 0.1;
Tstart = 0;
Tstop = 250;
time = Tstart:Tstep:Tstop;
n = size(time,2)-1;
% parameters of the cost function
C_w = diag(0.5:-(0.5-0.01)/2500:0.01);
Q = diag(10:(1-10)/n:1);
% parameters of the process to be controlled
T1 = 10;
T2 = 50;
% reference trajectory (desired one)
y_ref = 1 - exp(-time/8);

% controller parameters (to be evaluated)
K = %u00%;
Ti = %u01%;
