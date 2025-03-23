function decoded = entropy_decode(encoded, height, width, dict)
    
    % Decode the bitstream
    decoded = huffmandeco(encoded, dict);
    
    % Reshape the decoded component
    decoded = reshape(decoded, [height, width]);
end
