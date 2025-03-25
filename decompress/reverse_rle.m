% function [qY, qU, qV] = reverse_rle(rleY, rleU, rleV)
%
% Perform Run-Length Decoding (RLE) on quantized YUV components.
% Inputs:
%   rleY, rleU, rleV : RLE encoded bitstreams
%
% Outputs:
%   qY, qU, qV : Quantized YUV components
%
function [qY, qU, qV] = reverse_rle(rleY, rleU, rleV)
    run("config.m");
    qY = reshape(rle_decode(rleY), [DCT_WIDTH, DCT_HEIGHT_Y]);
    qU = reshape(rle_decode(rleU), [DCT_WIDTH, DCT_HEIGHT_UV]);
    qV = reshape(rle_decode(rleV), [DCT_WIDTH, DCT_HEIGHT_UV]);
end

% Run-Length Decoding (RLE) function
function rleDecoded = rle_decode(input)
    rleDecoded = [];
    for i = 1:2:length(input)
        rleDecoded = [rleDecoded, repmat(input(i), 1, input(i+1))];
    end
end