% function [quantizedY, quantizedU, quantizedV] = apply_quantization(dctY, dctU, dctV, quality)
%
% Quantizes the DCT coefficients of the YUV components
% Input:
%    dctY, dctU, dctV : DCT of the YUV components
%    quality : Quality factor (1 = high compression, 100 = low compression)
%
% Outputs:
%    qY, qU, qV : Quantized DCT coefficients

function [qY, qU, qV] = apply_quantization(dctY, dctU, dctV)
    run('config.m');

    qY = dctY;
    qU = dctU;
    qV = dctV;

    % Remove last N lines
    qY(N+1:end,:) = 0;
    qU(N+1:end,:) = 0;
    qV(N+1:end,:) = 0;

    % Quantization
    qY = round(qY ./ Q_LVL);
    qU = round(qU ./ Q_LVL);
    qV = round(qV ./ Q_LVL);
end
