function numTargetReach = dgmBwlimits(xBase, yBase)
%% dgmBwlimits Calculates the number of discrete points reached inside 
%the target area given the base position as the input and gives the number 
%of points reached by the given base as output.
%Uses IGM to calculate theta1 and theta2 for both elbow up and elbow down
%configuration and checks if they are within joint limits using function
%checkThetaLimit.

global targetArea  targetDimension L1 L2
endEffectorPos = [];

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




