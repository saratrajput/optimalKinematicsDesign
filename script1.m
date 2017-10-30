% clear all
% keepvars = {'saveEndEffectorPos'};

% clearvars('-except', keepvars{:});
clear all
close all

% Start process timer
tic

%% workshopDefinition
global workMap
workMap = zeros(400, 400);

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

%% obstacleDefinition

originO1 = [300, 150];
originO2 = [100, 300];
originO3 = [200, 100];
r = 50;

workMap(originO1(1)-r/2: originO1(1)+r/2, originO1(2)-r/2: originO1(2)+r/2) = 1;
workMap(originO2(1)-r/2: originO2(1)+r/2, originO2(2)-r/2: originO2(2)+r/2) = 1;
workMap(originO3(1)-r/2: originO3(1)+r/2, originO3(2)-r/2: originO3(2)+r/2) = 1;


%% get best base
% cols = checkObstacles( originO1(1), originO1(2), originO2(1), originO2(2), originO3(1), originO3(2), r )
base = [];

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


%% getting the max element
maxTargetReached = max(base(:,3));
bestBases = [];
for k = 1 : size(base,1)
    if ((base(k,3)) == maxTargetReached)
        bestBases = [bestBases; base(k,[1,2])];
    end
end

%% plot
axis([0 400 0 400])
rectangle('Position',[targetArea(1), targetArea(2), ...
    targetDimension(1), targetDimension(2)] );

% plot obstacles
hold on
viscircles(originO1, r);
hold on
viscircles(originO2, r);
hold on
viscircles(originO3, r);
    hold on
for i = 1:size(bestBases)
    plot(bestBases(i,1), bestBases(i,2), 'bx');
    hold on
end

for i = 1 : size(bestBases,1)
    myBase = [bestBases(i,1);bestBases(i,2)];
    % plotCoverage(myBase, 1) for elbow up configuration
    % plotCoverage(myBase, 2) for elbow down configuration
    plotCoverage(myBase, 1);

end

% End process timer
toc

