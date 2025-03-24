% function [compY, compU, compV] = decenter(centeredY, centeredU, centeredV)
%
% Decenter the Y, U, and V components
% Input parameters:
%    centeredY, centeredU, centeredV : Centered YUV components
%
% Output parameters:
%    compY, compU, compV : YUV components
%
function [compY, compU, compV] = decenter(centeredY, centeredU, centeredV)
    compY = centeredY + 128;
    compU = centeredU + 128;
    compV = centeredV + 128;    
end