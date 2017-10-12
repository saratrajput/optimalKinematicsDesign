function [ xEnd, yEnd ] = dgm( L1, L2, theta1, theta2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
xEnd = xBase + L1 * cos(theta1) + L2 * cos(theta1 + theta2);
yEnd = yBase + L1 * sin(theta1) + L2 * sin(theta1 + theta2);

end

