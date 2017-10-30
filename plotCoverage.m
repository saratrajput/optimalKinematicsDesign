function plotCoverage( myBase, config)
%plotCoverage Plots the robot configuration reaching the target area with
%base position as input.
% Calculates theta1 and theta2 given the base position using IGM.
% End-effector position is taken for the whole of the target area.
% Checks for the condition if the theta1 and theta2 are within the joing
% limits.
% Calls function plotGraph to plot the the joint lines

global targetArea targetDimension L1 L2
eePos = [];

for m = targetArea(1):10:targetArea(1)+targetDimension(1)
    for n = targetArea(2):10:targetArea(2)+targetDimension(2)
        [ thetaup1, thetaup2, thetadown1, thetadown2] = igm( m, n, ...
            myBase(1), myBase(2),L1, L2);
        
          if config == 1
              if checkThetaLimit( thetadown1, thetadown2) == 1
              eePos = [eePos;m,n,thetadown1, thetadown2];
              end
          end
          if config == 2
              if checkThetaLimit( thetaup1, thetaup2) == 1
              eePos = [eePos;m,n, thetaup1, thetaup2];
              end
%         if checkThetaLimit( thetadown1, thetadown2) == 1
%             eePos = [eePos;m,n,thetadown1, thetadown2];
        end
    end
end

%% plot
ee = [];
for i = 1:size(eePos)
    ee = [ee; plotGraph(myBase, eePos(i,3), eePos(i,4))];
end
if ~(isempty(ee))
delete(ee);
hold on
end
end

