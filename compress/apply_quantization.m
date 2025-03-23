
% function [qY, qU, qV] = apply_quantization(dctY, dctU, dctV)
%
% Quantizes the DCT coefficients of the YUV components
% Input:
%    dctY, dctU, dctV : DCT of the YUV components
%
% Outputs:
%    qY, qU, qV : Quantized DCT coefficients

function [qY, qU, qV] = apply_quantization(dctY, dctU, dctV)
    run('config.m');

    qY = round(dctY);
    qU = round(dctU);
    qV = round(dctV);
end