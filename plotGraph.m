function plotGraph( basePose,theta1, theta2)
%% plotGraph Plots the base, joint and end-effector position with base 
% position, theta1 and theta2 as input.
% Calculates joint position and end-effector position using DGM

global L1 L2 targetArea targetDimension

%% plot target area
% targetArea = [300, 300];
% 
% targetDimension = [50, 50];
% 
% rectangle('Position',[targetArea(1), targetArea(2), ...
%     targetDimension(1), targetDimension(2)] );

%% plot obstacles
% originO1 = [300, 150];
% originO2 = [100, 300];
% originO3 = [200, 100];
% r = 50;
% 
% hold on
% viscircles(originO1, r)
% hold on
% viscircles(originO2, r)
% hold on
% viscircles(originO3, r)

%% plot joints
hold on
plot(basePose(1),basePose(2),'rx')

joint1Pose = basePose + [L1 * cos(theta1); L1 * sin(theta1)];

xEnd = basePose(1) + L1 * cos(theta1) + L2*cos(theta1 + theta2);
yEnd = basePose(2) + L1 * sin(theta1) + L2*sin(theta1 + theta2);


hold on
l1 = line([basePose(1),joint1Pose(1)],[basePose(2),joint1Pose(2)]);
hold on

l2 = line([joint1Pose(1),xEnd],[joint1Pose(2),yEnd]);

pause(0.5);
delete(l1);
delete(l2);
hold on;





