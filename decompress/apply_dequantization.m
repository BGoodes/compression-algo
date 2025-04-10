% function [dctY, dctU, dctV] = apply_dequantization(qY, qU, qV)
%
% This function performs the reverse quantization of the DCT coefficients
% Input:
%    dctY, dctU, dctV : DCT of the YUV components
%
% Outputs:
%    dctY, dctU, dctV : DCT of the YUV components
%
function [dctY, dctU, dctV] = apply_dequantization(qY, qU, qV, L)
    run('config.m');
    
    dctY = qY * L;
    dctU = qU * L;
    dctV = qV * L;
end