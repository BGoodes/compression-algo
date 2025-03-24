% function [centeredY, centeredU, centeredV] = center(Y, U, V)
% 
% Center the Y, U, and V components
% Input parameters:
%    Y, U, V : YUV components
%
% Output parameters:
%    centeredY, centeredU, centeredV : Centered YUV components
%
function [centeredY, centeredU, centeredV] = center(Y, U, V)
    centeredY = Y - 128;
    centeredU = U - 128;
    centeredV = V - 128;    
end