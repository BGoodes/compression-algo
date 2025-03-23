function decompress(inputFile, outputFile)
    run('config.m');

    % Open the files
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');

    for i = 1:NB_FRAME
        % Read the encoded frame (Y, U, V)
        [encodedY, encodedU, encodedV] = read_bitstream(fidIn);

        % Decode the frame
        % decodedY = entropy_decode(encodedY, HEIGHT, WIDTH);
        % decodedU = entropy_decode(encodedU, HEIGHT/2, WIDTH/2);
        % decodedV = entropy_decode(encodedV, HEIGHT/2, WIDTH/2);

        % Write the decompressed frame
        fwrite(fidOut, encodedY', 'uint8');
        fwrite(fidOut, encodedU, 'uint8');
        fwrite(fidOut, encodedV, 'uint8');
    end

    % Close the files
    fclose(fidIn);
    fclose(fidOut);

    disp("Decompression complete. Output saved to " + outputFile);
end