% function [qY, qU, qV]  = entropy_decode(encodedY, encodedU, encodedV, dict)
%
% Perform entropy decoding on Y, U, and V components using Huffman coding.
% Inputs:
%   encodedY, encodedU, encodedV : Huffman encoded bitstreams
%   dict                         : Huffman dictionary
%
% Outputs:
%   qY, qU, qV : Quantized YUV components
%
function [qY, qU, qV] = entropy_decode(encodedY, encodedU, encodedV, dict)
    run('config.m');
    qY = reshape(huffmandeco(encodedY, dict), [DCT_WIDTH, DCT_HEIGHT_Y]);
    qU = reshape(huffmandeco(encodedU, dict), [DCT_WIDTH, DCT_HEIGHT_UV]);
    qV = reshape(huffmandeco(encodedV, dict), [DCT_WIDTH, DCT_HEIGHT_UV]);
end
