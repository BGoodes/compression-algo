% function [dctY, dctU, dctV]=apply_dct(centeredY, centeredU, centeredV)
%
% Computes the 8x8 DCT of the YUV components
% Input:
%    centeredY, centeredU et centeredV : YUV components centered
%
% Outputs:
%    dctY, dctU et dctV : DCT of the YUV components
%
function [dctY, dctU, dctV] = apply_dct(centeredY, centeredU, centeredV)
    dctY = bdct(centeredY, [8,8]);
    dctU = bdct(centeredU, [8,8]);
    dctV = bdct(centeredV, [8,8]);
end