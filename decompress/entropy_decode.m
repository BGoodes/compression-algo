function decoded = entropy_decode(encoded, height, width)
    
    symbols = 0:255;
    prob = ones(1, 256) / 256;

    % Create a Huffman dictionary
    dict = huffmandict(symbols, prob);
    
    % Decode the bitstream
    decoded = huffmandeco(encoded, dict);
    
    % Reshape the decoded component
    decoded = reshape(decoded, [height, width]);
end
