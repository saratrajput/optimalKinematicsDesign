function plotGraph( basePose, theta1, theta2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% close all;
global L1 L2

%% plot target area
% L1 = 100;
% L2 = 100;
targetArea = [300, 300];

targetDimension = [50, 50];

rectangle('Position',[targetArea(1), targetArea(2), ...
    targetDimension(1), targetDimension(2)] );

%% plot obstacles
originO1 = [300, 150];
originO2 = [100, 300];
originO3 = [200, 100];
r = 50;

hold on
viscircles(originO1, r)
hold on
viscircles(originO2, r)
hold on
viscircles(originO3, r)

%% plot joints
hold on
% basePose = [201; 251];
plot(basePose(1),basePose(2),'rx')

% endPose = [300, 350];

% [ ~, ~, theta1, theta2] = igm(endPose(1), endPose(2), basePose(1),...
%     basePose(2), L1, L2);
% theta1 = 1.5807;
% theta2 = -1.5907;
joint1Pose = basePose + [L1 * cos(theta1); L1 * sin(theta1)];
% joint2Pose = joint1Pose + [L2 * cos(theta1+theta2); L2*sin(theta1+theta2)];

xEnd = basePose(1) + L1 * cos(theta1) + L2*cos(theta1 + theta2);
yEnd = basePose(2) + L1 * sin(theta1) + L2*sin(theta1 + theta2);


hold on
l1 = line([basePose(1),joint1Pose(1)],[basePose(2),joint1Pose(2)]);
hold on
% line([joint1Pose(1),endPose(1)],[joint1Pose(2),endPose(2)]);

l2 = line([joint1Pose(1),xEnd],[joint1Pose(2),yEnd]);
% delete(l1);
% delete(l2);
pause(0.5);
delete(l1);
delete(l2);
hold on;





