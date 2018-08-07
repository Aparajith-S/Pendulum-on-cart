% Name: Aparajith Sridharan
% Date: 03-08-2018
% first order ODEs for the pendulum and cart system. 

function x = cartpendulum_system(y,m,M,L,g,b,u)

sine = sin(y(3));
cosine = cos(y(3));
Den = m*L*L*(M+m*(1-cosine^2));
x(1,1) = y(2);
x(2,1) = (1/Den)*(-m^2*L^2*g*cosine*sine + m*L^2*(m*L*y(4)^2*sine - b*y(2))) + m*L*L*(1/Den)*u;
x(3,1) = y(4);
x(4,1) = (1/Den)*((m+M)*m*g*L*sine - m*L*cosine*(m*L*y(4)^2*sine - b*y(2))) - m*L*cosine*(1/Den)*u;

end