function [ xEnd, yEnd ] = dgm( xBase,yBase, theta1, theta2)
%% dgm Calculates the end-effector position given the base position, theta1
%and theta2 as input. 

global L1 L2

xEnd = xBase + L1 * cos(theta1) + L2 * cos(theta1 + theta2);
yEnd = yBase + L1 * sin(theta1) + L2 * sin(theta1 + theta2);

end

