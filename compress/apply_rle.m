% function [rleY, rleU, rleV] = apply_rle(qY, qU, qV)
% 
% Apply Run-Length Encoding (RLE) on quantized YUV components.
% Inputs:
%   qY, qU, qV : Quantized YUV components
%
% Outputs:
%   rleY, rleU, rleV : RLE encoded bitstreams
%
function [rleY, rleU, rleV] = apply_rle(qY, qU, qV)
    rleY = rle_encode(qY(:)');
    rleU = rle_encode(qU(:)');
    rleV = rle_encode(qV(:)');
end

% Run-Length Encoding (RLE) function
function rleEncoded = rle_encode(input)
    rleEncoded = [];
    count = 1;
    for i = 2:length(input)
        if input(i) == input(i-1)
            count = count + 1;
        else
            rleEncoded = [rleEncoded, input(i-1), count];
            count = 1;
        end
    end
    rleEncoded = [rleEncoded, input(end), count];
end