function [ cols ] = checkObstacles( XA, YA, XB, YB, XC, YC, R )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
cols = 0;
a = ((XB-XA)^2 + (YB-YA)^2);
b = (2*XA*(XB-XA) - 2*XC*(XB-XA) + 2*YA*(YB-YA) - 2*YC*(YB-YA));
c = XA^2 + XC^2 - 2*XA*XC + YA^2 + YC^2 - 2*YA*YC - R^2;
delta = b^2 - 4*a*c;
if (delta>=0) t1 = (-b - sqrt(delta))/(2*a);
t2 = (-b + sqrt(delta))/(2*a);
if ((t1 >= 0 && t1 <= 1) || (t2 >= 0 && t2 <= 1))
cols = 1;
end
end


end

