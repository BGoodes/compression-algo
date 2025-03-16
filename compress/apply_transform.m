% function [dctY,dctU,dctV]=apply_transform(compY,compU,compV)
%
% Computes the DCT of the YUV components
% Input:
%    compY, compU et compV : YUV components of the image
%
% Outputs:
%    dctY, dctU et dctV : DCT of the YUV components

function [dctY,dctU,dctV]=apply_transform(compY,compU,compV)
    dctY = bdct(compY, [8,8]);
    dctU = bdct(compU, [8,8]);
    dctV = bdct(compV, [8,8]);
end
