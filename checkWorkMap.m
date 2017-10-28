function [ outOfLimit ] = checkWorkMap( input1, input2)
%checkWorkMap Checks if the given input: base position, end-effector
%position or joint position are within the the limits of the work map.
%outOfLimit = 0 if the input is within work map limits.
%outOfLimit = 1 if the input is outside work map limits.

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

