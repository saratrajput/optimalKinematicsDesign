function ee = plotGraph( basePose,theta1, theta2)
%% plotGraph Plots the base, joint and end-effector position with base 
% position, theta1 and theta2 as input.
% Calculates joint position and end-effector position using DGM

global L1 L2 targetArea targetDimension obs


%% plot joints
hold on
plot(basePose(1),basePose(2),'rx')

joint1Pose = basePose + [L1 * cos(theta1); L1 * sin(theta1)];

xEnd = basePose(1) + L1 * cos(theta1) + L2*cos(theta1 + theta2);
yEnd = basePose(2) + L1 * sin(theta1) + L2*sin(theta1 + theta2);

if checkWorkMap(joint1Pose(1), joint1Pose(2)) == 0
    if (checkObstaclesMod(basePose(1), basePose(2), joint1Pose(1),...
            joint1Pose(2), obs) == 0) && (checkObstaclesMod(joint1Pose(1),...
            joint1Pose(2), xEnd, yEnd, obs) == 0)
        hold on
        l1 = line([basePose(1),joint1Pose(1)],[basePose(2),joint1Pose(2)]);
        hold on
        
        l2 = line([joint1Pose(1),xEnd],[joint1Pose(2),yEnd]);
        
        hold on
        ee = plot(xEnd, yEnd, 'bo');
        pause();
        delete(l1);
        delete(l2);
    else
        ee = [];
    end
    
else
    ee = [];
end
hold on;

