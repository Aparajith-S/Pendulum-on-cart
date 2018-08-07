% A function to visualize the cart and pendulum system in the real world.
% Author Name: Aparajith Sridharan
% Modified Date: 04-08-2018

function system_draw(y,m,M,L)
x = y(1);
thetha = y(3);

% dimensions
% L = pendulum length
W = 1*sqrt(M/5);  % cart width
H = .5*sqrt(M/5); % cart height
wr = .2; % wheel radius
mr = .3*sqrt(m); % mass radius

% positions
% y = wr/2; % cart vertical position
y = wr/2+H/2; % cart vertical position
w1x = x-.9*W/2;
w1y = 0;
w2x = x+.9*W/2-wr;
w2y = 0;

px = x + L*sin(thetha);
py = y - L*cos(thetha);

%% draw the cart
figure(1);
plot([-10 10],[0 0],'k','LineWidth',2);
hold on
rectangle('Position',[x-W/2,y-H/2,W,H],'FaceColor',[0 0 1])
rectangle('Position',[w1x,w1y,wr,wr],'Curvature',1,'FaceColor',[0 0 0])
rectangle('Position',[w2x,w2y,wr,wr],'Curvature',1,'FaceColor',[0 0 0])

%% draw the pendulum
plot([x px],[y py],'k','LineWidth',2)
rectangle('Position',[px-mr/2,py-mr/2,mr,mr],'Curvature',1,'FaceColor',[0 0 0])

%% set axis limits (good to maintain an aspect ratio of 2:1)
xlim([-10 10]);
ylim([-5 5]);
xlabel('<----- x ----->');
set(gcf,'Position',[0 200 750 375]);
drawnow;
hold off;
end