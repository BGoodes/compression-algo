% function [encodedY, encodedU, encodedV] = entropy_encode(qY, qU, qV, dict)
%
% Perform entropy encoding on Y, U, and V components using Huffman coding.
% Inputs:
%   qY, qU, qV  : Quantized YUV components
%   dict        : Huffman dictionary
%
% Outputs:
%   encodedY, encodedU, encodedV : Huffman encoded bitstreams
%
function [encodedY, encodedU, encodedV] = entropy_encode(rleY, rleU, rleV, dict)
    encodedY = huffmanenco(rleY, dict);
    encodedU = huffmanenco(rleU, dict);
    encodedV = huffmanenco(rleV, dict);
end