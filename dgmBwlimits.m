function numTargetReach = dgmBwlimits(xBase, yBase)
%% dgmBwlimits Calculates the number of discrete points reached inside 
%the target area given the base position as the input and gives the number 
%of points reached by the given base as output.
%Uses IGM to calculate theta1 and theta2 for both elbow up and elbow down
%configuration and checks if they are within joint limits using function
%checkThetaLimit.

global targetArea  targetDimension L1 L2
endEffectorPos = [];
%% approach1
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

%% approach2
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




