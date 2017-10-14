function [ xBase, yBase ] = findBase( L1, L2, theta1, theta2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
xBase = xEnd - (L1 * cos(theta1a) + L2 * cos(theta1a + theta2a));

yBase = yEnd - (L1 * sin(theta1a) + L2 * sin(theta1a + theta2a));

end

