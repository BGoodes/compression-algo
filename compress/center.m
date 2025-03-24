% function [centeredY, centeredU, centeredV] = center(compY, compU, compV)
% 
% Center the Y, U, and V components
% Input parameters:
%   compY, compU, compV : YUV components
%
% Output parameters:
%    centeredY, centeredU, centeredV : Centered YUV components
%
function [centeredY, centeredU, centeredV] = center(compY, compU, compV)
    centeredY = compY - 128;
    centeredU = compU - 128;
    centeredV = compV - 128;    
end