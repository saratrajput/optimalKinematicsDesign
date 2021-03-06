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
% targetArea = [300, 300];
targetArea = [50, 250];

targetDimension = [50, 50];
% targetDimension = [50, 100];

workMap(targetArea(1):targetArea(1)+targetDimension(1), targetArea(2):targetArea(2)...
    +targetDimension(1)) = 1;

%% obstacleDefinition
global obs
obs = [75, 150, 30;...
    200, 300, 30;...
    200, 100, 30;...
    300, 200, 25;...
    275, 350, 20;...
    350, 250, 15 ];

for i = 1 : size(obs, 1)
workMap(obs(i,1)-obs(i,3)/2: obs(i,1)+obs(i,3)/2, ...
    obs(i,2)-obs(i,3)/2: obs(i,2)+obs(i,3)/2) = 1;
    
end


%% get best base
% cols = checkObstacles( originO1(1), originO1(2), originO2(1), originO2(2), originO3(1), originO3(2), r )
base = [];

for i = 1:50:size(workMap,1)
    for j = 1:50: size(workMap, 2)
        xBase = i;
        yBase = j;
        
        xEnd = targetArea(1);
        yEnd = targetArea(2);
        
        if isempty(igm(xEnd,yEnd,xBase,yBase,L1,L2))
            ;
        else
            % to check if base values greater than workMap area
            if checkWorkMap(i, j)
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
for k = 1 : size(obs, 1)
    hold on
    viscircles(obs(k,1:2), obs(k,3));
end

hold on

for i = 1:size(bestBases)
    plot(bestBases(i,1), bestBases(i,2), 'bx');
    hold on
end

for i = 1 : size(bestBases,1)
    myBase = [bestBases(i,1);bestBases(i,2)];
    % plotCoverage(myBase, 1) for elbow up configuration
    % plotCoverage(myBase, 2) for elbow down configuration
    plotCoverage(myBase, 2);

end

% End process timer
toc

