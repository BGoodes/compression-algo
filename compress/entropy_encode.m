% function encoded = entropy_encode(comp)
%
% Perform entropy encoding on a component using Huffman coding
% Inputs:
%   comp : Y, U, or V component
%
% Outputs:
%   encoded : Huffman encoded bitstream

function encoded = entropy_encode(comp, dict)
    % Reshape the component into a vector
    comp = comp(:);
    
    encoded = huffmanenco(comp, dict);
end
