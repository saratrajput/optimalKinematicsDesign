function insideLimit = checkThetaLimit( theta1, theta2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% joint1Min = -132*(pi/180);
% joint1Max = 132*(pi/180);
% 
% joint2Min = -141*(pi/180);
% joint2Max = 141*(pi/180);
global joint1Min joint1Max joint2Min joint2Max


insideLimit = 0;
if isempty([theta1, theta2])
    insideLimit = 0;
else (theta1>=joint1Min) && (theta1<=joint1Max) && (theta2>=joint2Min) ...
        && (theta2<=joint2Max)
    insideLimit = 1;
end

end

