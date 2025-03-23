% function decoded = entropy_decode(encoded, height, width, dict)
%
% Perform entropy decoding on a component using Huffman coding
% Inputs:
%   encoded : Huffman encoded bitstream
%   height : Height of the component
%   width : Width of the component
%   dict : Huffman dictionary
%
% Outputs:
%   decoded : Huffman decoded component
%
function decoded = entropy_decode(encoded, height, width, dict)
    
    % Decode the bitstream
    decoded = huffmandeco(encoded, dict);
    
    % Reshape the decoded component
    decoded = reshape(decoded, [height, width]);
end
