function endEffectorPos = dgmBwlimits(xBase, yBase)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
L1 = 100;
L2 = 100;
% workMap = zeros(400,400);

joint1Min = -132*(pi/180);
joint1Max = 132*(pi/180);

joint2Min = -141*(pi/180);
joint2Max = 141*(pi/180);
% xBase = 100;
% yBase = 400;
endEffectorPos = [];
for m= joint1Min:0.5:joint1Max
    for n = joint2Min:0.5:joint2Max
       x = xBase + L1 * cos(m) + L2 * cos(m + n);
       y = yBase + L1 * sin(m) + L2 * sin(m + n);
       if checkWorkMap(x,y) == true
           ;
       else
           endEffectorPos = [endEffectorPos; x,y];
       end
    end
        
end


        


