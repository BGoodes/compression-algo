% function [dctY, dctU, dctV] = reverse_quantization(qY, qU, qV)
%
% This function performs the reverse quantization of the DCT coefficients
% Input:
%    dctY, dctU, dctV : DCT of the YUV components
%
% Outputs:
%    dctY, dctU, dctV : DCT of the YUV components

function [dctY, dctU, dctV] = reverse_quantization(qY, qU, qV)
    run('config.m');
    
    dctY = qY;
    dctU = qU;
    dctV = qV;
end
