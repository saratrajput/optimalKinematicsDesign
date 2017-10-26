% clear all
% keepvars = {'saveEndEffectorPos'};

% clearvars('-except', keepvars{:});
clear all
close all

% Start process timer
tic

%% workshopDefinition

workMap = zeros(400, 400);

% originWorkshop = [0, 0];
% lenWorkshop = size(workMap,1);
% breadthWorkshop = size(workMap,2);
% 
% rectangle('Position',[0, 0, size(workMap,1), size(workMap,2));
%% robotDefinition
global L1 L2 joint1Min joint1Max joint2Min joint2Max
L1 = 100;
L2 = 100;

joint1Min = -132*(pi/180);
joint1Max = 132*(pi/180);

joint2Min = -141*(pi/180);
joint2Max = 141*(pi/180);

%% target area
global targetArea targetDimension
targetArea = [300, 300];

targetDimension = [50, 50]; 

workMap(targetArea(1):targetArea(1)+targetDimension(1), targetArea(2):targetArea(2)...
    +targetDimension(1)) = 1;
% hold on;
% rectangle('Position',[targetArea(1), targetArea(2), targetDimension(1), targetDimension(2)] );

%% obstacleDefinition

originO1 = [300, 150];
originO2 = [100, 300];
originO3 = [200, 100];
r = 50;

workMap(originO1(1)-r/2: originO1(1)+r/2, originO1(2)-r/2: originO1(2)+r/2) = 1;
workMap(originO2(1)-r/2: originO2(1)+r/2, originO2(2)-r/2: originO2(2)+r/2) = 1;
workMap(originO3(1)-r/2: originO3(1)+r/2, originO3(2)-r/2: originO3(2)+r/2) = 1;

% hold on
% viscircles(originO1, r)
% hold on
% viscircles(originO2, r)
% hold on
% viscircles(originO3, r)

%% plots
% cols = checkObstacles( originO1(1), originO1(2), originO2(1), originO2(2), originO3(1), originO3(2), r )
% hold on;
% rectangle('Position',[xO1, yO1, rO1, rO1], 'Curvature', [1 1]);
% plot(xO1, yO1, '.r', 'Markersize',rO1)
% line([L1*cos(theta1),L1 * cos(theta1) + L2 * cos(theta1 + theta2) ], [L1*sin(theta1), L1 * sin(theta1) + L2 * sin(theta1 + theta2)])
% line([0, L1*cos(theta1)], [0, L1*sin(theta1)])

% theta1a = [];
% theta2a = [];
% theta1b = [];
% theta2b = [];
% theta = [];
base = [];
% base2 = [];
for i = 1:50:size(workMap,1)
    for j = 1:50: size(workMap, 2)
        xBase = i;
        yBase = j;
        
        xEnd = targetArea(1);
        yEnd = targetArea(2);
        
        
%         [theta1a,theta2a,theta1b,theta2b] = igm(xEnd,yEnd,xBase,yBase,L1,L2);
        if isempty(igm(xEnd,yEnd,xBase,yBase,L1,L2))
%         if isempty(theta1a)
            ;
        else
            % theta = [theta; theta1a, theta2a, theta1b, theta2b];
%             [base1, base2] = findBase(L1, L2, theta1a, theta2a);
%             base1 = xBase;
%             base2 = yBase;
            % to check if base values greater than workMap area
%             if base1 > size(workMap,1) | base2 > size(workMap,2)
            if i > size(workMap,1) || j > size(workMap,2)
                ;
            else
                % to check for obstacles
                if (workMap(i, j) == 1)
                    ;
                else
                
                base = [base; i, j];
                end
            end
        end
        
        
    end
end

for m = 1:size(base,1)
    numTargetReach = dgmBwlimits(base(m,1), base(m,2));
    base(m, 3) = numTargetReach;
end
myBase = [201;251];
endEffectorPos = [];
for m = targetArea(1):10:targetArea(1)+targetDimension(1)
    for n = targetArea(2):10:targetArea(2)+targetDimension(2)
        [ thetaup1, thetaup2, thetadown1, thetadown2] = igm( m, n, ...
            myBase(1), myBase(2),L1, L2);
        
%         if checkThetaLimit(thetaup1, thetaup2) == 1
%             endEffectorPos = [endEffectorPos;m,n, thetaup1, thetaup2];
          if checkThetaLimit( thetadown1, thetadown2) == 1
            endEffectorPos = [endEffectorPos;m,n,thetadown1, thetadown2];
        end
    end
end


% End process timer
toc

% % Construct a questdlg with three options
%         choice = questdlg('Choose an arm configuration', ...
%             'Arm configuration', ...
%             'Left hand','Right hand','Left hand');
%         % Handle response
%         switch choice
%             case 'Left hand'
%                 title([choice ' configuration chosen.'])
%                 plotmotion.conf = 2;
%             case 'Right hand'
%                 title([choice ' configuration chosen.'])
%                 plotmotion.conf = 1;
%         end