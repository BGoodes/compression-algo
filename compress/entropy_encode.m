% function encoded = entropy_encode(comp)
%
% Perform entropy encoding on a component using Huffman coding
% Inputs:
%   comp : Y, U, or V component
%
% Outputs:
%   encoded : Huffman encoded bitstream

function encoded = entropy_encode(comp)
    % Reshape the component into a vector
    comp = comp(:);
    
    % Compute the probability of each symbol
    symbols = unique(comp);
    counts = histcounts(comp, [symbols; max(symbols) + 1]);
    prob = counts / sum(counts);
    
    % Create a dictionary
    dict = huffmandict(symbols, prob);
    
    encoded = huffmanenco(comp, dict);
end
