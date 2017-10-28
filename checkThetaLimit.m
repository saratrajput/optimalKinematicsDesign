function insideLimit = checkThetaLimit( theta1, theta2)
%% checkThetaLimit Checks if joint angles are within the joint limits with 
%theta1 and theta2 as input and gives insideLimit as out where:
%insideLimit = 1 if theta1 and theta2 are within joint limits.
%insideLimit = 0 if theta1 and theta2 are outside joint limits.
global joint1Min joint1Max joint2Min joint2Max


insideLimit = 0;
if isempty([theta1, theta2])
    insideLimit = 0;
elseif (theta1>=joint1Min) && (theta1<=joint1Max) && (theta2>=joint2Min) ...
        && (theta2<=joint2Max)
    insideLimit = 1;
end

end

