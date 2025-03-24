% function [compY, compU, compV]=apply_idct(dctY, dctU, dctV)
%
% Computes the inverse DCT of the YUV components
% Input:
%    dctY, dctU et dctV : DCT of the YUV components
%
% Outputs:
%    compY, compU et compV : YUV components of the image
%
function [compY, compU, compV] = apply_idct(dctY, dctU, dctV)
    run('config.m');

    compY = ibdct(dctY, [8,8], [HEIGHT WIDTH]);
    compU = dctU;
    compV = dctV;
end