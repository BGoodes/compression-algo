% function [dctY,dctU,dctV]=apply_transform(compY,compU,compV)
%
% Computes the DCT of the YUV components
% Input:
%    compY, compU et compV : YUV components of the image
%
% Outputs:
%    dctY, dctU et dctV : DCT of the YUV components

function [dctY,dctU,dctV]=apply_transform(compY,compU,compV)
    dctY = dct2(compY);
    dctU = dct2(compU);
    dctV = dct2(compV);
end
