function insideLimit = checkTargetArea( targetArea,targetDimension,input1, input2 )
%checkTargetArea checks if input1 and input2 which are the end-effector
%position lie within the target area which is taken as input too.
%insideLimit = 0 if the end-effector position is outside the target area.
%insideLimit = 1 if the end-effector position is inside the target area. 

insideLimit = 0;
if (input1>=targetArea(1)) && (input1<=targetArea(1)+targetDimension(1)) ...
       && (input2>=targetArea(2)) && (input2<=targetArea(2)+targetDimension(2))
    insideLimit = 1;
end


end

