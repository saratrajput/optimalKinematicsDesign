function [ xBase, yBase ] = findBase( L1, L2, theta1, theta2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
xEnd = 300;
yEnd = 400;
xBase = xEnd - (L1 * cos(theta1) + L2 * cos(theta1 + theta2));

yBase = yEnd - (L1 * sin(theta1) + L2 * sin(theta1 + theta2));

% if (yBase > 400)

end

