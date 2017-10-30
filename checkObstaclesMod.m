function [ cols ] = checkObstaclesMod( XA, YA, XB, YB, obs )
%% checkObstacles check if one given segment intersect one given obstacle
%returns 1 if collides, 0 if not
%segment AB, disc obstacle : center C, radius R
%obs is taken as input which is the obstacles matrix.
cols = 0;
for i = 1 : size(obs, 1)
% cols = 0;
a = ((XB-XA)^2 + (YB-YA)^2);
b = (2*XA*(XB-XA) - 2*obs(i,1)*(XB-XA) + 2*YA*(YB-YA) - 2*obs(i,2)*(YB-YA));
c = XA^2 + obs(i,1)^2 - 2*XA*obs(i,1) + YA^2 + obs(i,2)^2 - 2*YA*obs(i,2) - obs(i,3)^2;
delta = b^2 - 4*a*c;

if (delta>=0) t1 = (-b - sqrt(delta))/(2*a);
t2 = (-b + sqrt(delta))/(2*a);

if ((t1 >= 0 && t1 <= 1) || (t2 >= 0 && t2 <= 1))
cols = 1;
end
end


end


end

