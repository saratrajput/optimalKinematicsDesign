function [ outOfLimit ] = checkWorkMap( input1, input2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
workMap= [400;400];
outOfLimit = 0;
if input1 > workMap(1) || input2 > workMap(2)
    outOfLimit = 1;
else
    if input1<0 || input2<0
        outOfLimit = 1;
    else
        outOfLimit = 0;
    end
end
       

end

