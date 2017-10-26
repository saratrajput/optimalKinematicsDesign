function insideLimit = checkTargetArea( targetArea,targetDimension,input1, input2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
insideLimit = 0;
if (input1>=targetArea(1)) && (input1<=targetArea(1)+targetDimension(1)) ...
       && (input2>=targetArea(2)) && (input2<=targetArea(2)+targetDimension(2))
    insideLimit = 1;
end
% if (input2>targetArea(2)) && (input2<targetArea(2)+targetDimension(2))
%     insideLimit = 1;
% end


end

