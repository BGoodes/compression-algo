% function [qY, qU, qV]  = entropy_decode(encodedY, encodedU, encodedV, dict)
%
% Perform entropy decoding on Y, U, and V components using Huffman coding.
% Inputs:
%   encodedY, encodedU, encodedV : Huffman encoded bitstreams
%   dict : Huffman dictionary
%
% Outputs:
%   qY, qU, qV : Quantized YUV components
%
function [rleY, rleU, rleV] = entropy_decode(encodedY, encodedU, encodedV, dict)
    rleY = huffmandeco(encodedY, dict);
    rleU = huffmandeco(encodedU, dict);
    rleV = huffmandeco(encodedV, dict);
end