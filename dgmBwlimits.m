function numTargetReach = dgmBwlimits(xBase, yBase)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% L1 = 100;
% L2 = 100;
% workMap = zeros(400,400);

% joint1Min = -132*(pi/180);
% joint1Max = 132*(pi/180);
% 
% joint2Min = -141*(pi/180);
% joint2Max = 141*(pi/180);
% targetArea = [300, 300];
% targetDimension = [50, 50];
global targetArea  targetDimension L1 L2
% targetArea = getGlobal(targetArea);
% targetDimension = getGlobal(targetDimension); 
endEffectorPos = [];
% for m= joint1Min:0.05:joint1Max
%     for n = joint2Min:0.05:joint2Max
%        x = xBase + L1 * cos(m) + L2 * cos(m + n);
%        y = yBase + L1 * sin(m) + L2 * sin(m + n);
%        x= round(x);
%        y = round(y);
%        if checkTargetArea(targetArea,targetDimension,x,y) == true
%            endEffectorPos = [endEffectorPos; x,y];
%            endEffectorPos = unique(endEffectorPos,'rows','stable');
% %        else
% %            endEffectorPos = [endEffectorPos; x,y];
%        end
%     end
%         
% end
% numTargetReach = size(endEffectorPos,1);

for m = targetArea(1):5:targetArea(1)+targetDimension(1)
    for n = targetArea(2):5:targetArea(2)+targetDimension(2)
        [ thetaup1, thetaup2, thetadown1, thetadown2] = igm( m, n, xBase, yBase,L1, L2);
        
        if checkThetaLimit(thetaup1, thetaup2) == 1
            endEffectorPos = [endEffectorPos;m,n, thetaup1, thetaup2];
        elseif checkThetaLimit( thetadown1, thetadown2) == 1
            endEffectorPos = [endEffectorPos;m,n,thetadown1, thetadown2];
        end
    end
end
numTargetReach = size(endEffectorPos,1);




