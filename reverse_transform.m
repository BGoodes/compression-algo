% function [compY, compU, compV]=reverse_transform(dctY, dctU, dctV)
%
% Computes the inverse DCT of the YUV components
% Input:
%    dctY, dctU et dctV : DCT of the YUV components
%
% Outputs:
%    compY, compU et compV : YUV components of the image

function [compY, compU, compV]=reverse_transform(dctY, dctU, dctV)
    compY = idct2(dctY);
    compU = idct2(dctU);
    compV = idct2(dctV);
end
