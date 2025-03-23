
% function [qY, qU, qV] = apply_quantization(dctY, dctU, dctV)
%
% Quantizes the DCT coefficients of the YUV components
% Input:
%    dctY, dctU, dctV : DCT of the YUV components
%
% Outputs:
%    qY, qU, qV : Quantized DCT coefficients

function [qY, qU, qV] = apply_quantization(dctY, dctU, dctV, N, L)
    run("config.m")

    qY = round(dctY / L);
    qU = round(dctU / L);
    qV = round(dctV / L);

    % Remove last N lines
    qY(N+1:end,:) = 0;
    qU(N+1:end,:) = 0;
    qV(N+1:end,:) = 0;
end