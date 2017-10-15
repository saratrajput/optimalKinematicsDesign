% clear all
keepvars = {'oldBase'};

clearvars('-except', keepvars{:});
% close all

% Start process timer
tic

%% workshopDefinition

workMap = zeros(400, 400);

% originWorkshop = [0, 0];
% lenWorkshop = size(workMap,1)/100;
% breadthWorkshop = size(workMap,2)/100;
% 
% rectangle('Position',[originWorkshop(1), originWorkshop(2), lenWorkshop...
%     breadthWorkshop]);
%% robotDefinition
L1 = 100;
L2 = 100;

joint1Min = -132*(pi/180);
joint1Max = 132*(pi/180);

joint2Min = -141*(pi/180);
joint2Max = 141*(pi/180);

%% working area
workingArea = [300, 300];

lenWA = 50;
breadthWA = 50;

workMap(workingArea(1):workingArea(1)+lenWA, workingArea(2):workingArea(2)...
    +breadthWA) = 1;
% hold on;
% rectangle('Position',[workingArea(1)/10, workingArea(2)/10, lenWA/10, ...
%     breadthWA/10]);

%% obstacleDefinition

originO1 = [300, 150];
% yO1 = 1.5;
originO2 = [100, 300];
originO3 = [200, 100];
r = 50;

workMap(originO1(1)-r/2: originO1(1)+r/2, originO1(2)-r/2: originO1(2)+r/2) = 1;
workMap(originO2(1)-r/2: originO2(1)+r/2, originO2(2)-r/2: originO2(2)+r/2) = 1;
workMap(originO3(1)-r/2: originO3(1)+r/2, originO3(2)-r/2: originO3(2)+r/2) = 1;

% hold on
% viscircles(originO1/100, r)
% hold on
% viscircles(originO2/100, r)
% hold on
% viscircles(originO3/100, r)

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
theta = [];
base = [];
% base2 = [];
for i = 1:size(workMap,1)
    for j = 1: size(workMap, 2)
        xBase = i;
        yBase = j;
        
        xEnd = workingArea(1);
        yEnd = workingArea(2);
        
        [theta1a,theta2a,theta1b,theta2b] = igm(xEnd,yEnd,xBase,yBase,L1,L2);
        if isempty(theta1a)
            ;
        else
%             theta = [theta; theta1a, theta2a, theta1b, theta2b];
            [base1, base2] = findBase(L1, L2, theta1a, theta2a);
            base = [base; base1, base2];
        end
        
%         [base1, base2] = findBase(L1, L2, theta(1, i), theta(2,i));
%         base = [base; base1, base2];
%         base2 = [base2; findBase(L1, L2, theta(3, i), theta(4,i))];
    end
end
        
% End process timer
toc