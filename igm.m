function [ theta1a, theta2a, theta1b, theta2b] = igm( xEnd, yEnd, xBase, yBase,L1, L2)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

C2 = ((xEnd-xBase)^2 + (yEnd-yBase)^2 - L1^2 - L2^2) / (2*L1*L2);
if C2 <= 1
    theta2a = atan2(sqrt(1-C2^2), C2);
    theta2b = atan2(-sqrt(1-C2^2), C2);
    
    B1 = (L1 + L2*C2);
    S2a = sin(theta2a);
    S2b = sin(theta2b);
    
    B2a= L2*S2a;
    B2b= L2*S2b;
    
    S1a = (B1*(yEnd-yBase) - B2a*(xEnd-xBase)) / (B1^2 + B2a^2);
    C1a = (B1*(xEnd-xBase) + B2a*(yEnd-yBase)) / (B1^2 + B2a^2);
    
    S1b = (B1*(yEnd-yBase) - B2b*(xEnd-xBase)) / (B1^2 + B2b^2);
    C1b = (B1*(xEnd-xBase) + B2b*(yEnd-yBase)) / (B1^2 + B2b^2);
    
    theta1a = atan2(S1a, C1a);
    theta1b = atan2(S1b, C1b);
else
    warning('Base not suitable');
    theta1a = NaN;
    theta2a = NaN;
    theta1b = NaN;
    theta2b = NaN;
end

% xBase = xEnd - (L1 * cos(theta1a) + L2 * cos(theta1a + theta2a));
% yBase = yEnd - (L1 * sin(theta1a) + L2 * sin(theta1a + theta2a));

end

