% function [centeredY, centeredU, centeredV]=apply_idct(dctY, dctU, dctV)
%
% Computes the inverse DCT of the YUV components
% Input:
%    dctY, dctU et dctV : DCT of the YUV components
%
% Outputs:
%    centeredY, centeredU et centeredV : YUV components centered
%
function [centeredY, centeredU, centeredV] = apply_idct(dctY, dctU, dctV)
    run('config.m');

    centeredY = ibdct(dctY, [8,8], [HEIGHT WIDTH]);
    centeredU = dctU;
    centeredV = dctV;
end