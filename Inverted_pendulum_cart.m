% Script to demonstrate a LQR controller and run a simulation of an inverted pendulum on a cart.
% Name: Aparajith Sridharan
% Modified Date: 04-08-2018

clear all;
clc;

%% System parameters
% m is mass of pendulum, M is that of cart
% l is the length of the massless pole on which the pendulum rests
% b is the damping variable 

m = 2; %kg
M = 10; %kg
l = 2; %m
g = -9.81; %m/s/s
b = 1; 

%% define linearized system matrices around theta = pi for pendulum up position
A = [0 1 0 0;
    0 -b/M -m*g/M 0;
    0 0 0 1;
    0 -b/(M*l) -(m+M)*g/(M*l) 0];

B = [0; 1/M; 0; 1/(M*l)];

C = [1 0 0 0;0 0 1 0];
D = 0;
%% LQR controller penalty matrices

Q = [1 0 0 0;...
     0 1 0 0;
     0 0 10 0;
     0 0 0 50];
R = (0.001)^2;

%% controllability check
ctrbi = det(ctrb(A,B));

%% initial output variables
x_0 = 5; %m
disturb = pi/3; %radians 
Theta_0 = pi+disturb; %radians
y0 = [x_0; 0; Theta_0; 0];
  
if(ctrbi)
 count = 1;
 
  K = lqr(A,B,Q,R);
  %set integration time of 15 secs and time step to 1 ms
  tspan = 0:.001:15;
  % Reference
    Ref = [0; 0; pi; 0];  
  % Integrate to get system output  
    [t,y] = ode45(@(t,y)cartpendulum_system(y,m,M,l,g,b,-K*(y-[1; 0; pi; 0])),tspan,y0);  
    
%% display the simulation animation

  for i=1:100:length(t)
    system_draw(y(i,:),m,M,l);
    %pause(5/50);  
  end
  
%% graphical results
figure(2);
subplot(2,1,1);
plot(tspan,y(:,1)','b-');
xlabel('time [s]');
ylabel('distance [m]');
subplot(2,1,2);
plot(tspan,(y(:,3)-pi),'r-');
xlabel('time [s]');
ylabel('angle [rad]');

else
    
    disp('system is not controllable')

end
