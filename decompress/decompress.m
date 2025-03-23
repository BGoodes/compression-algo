function decompress(inputFile, outputFile, dict)
    run('config.m');

    % Open the files
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');

    for i = 1:NB_FRAME
        % Read the encoded frame (Y, U, V)
        [encodedY, encodedU, encodedV] = read_bitstream(fidIn);

        % Decode the frame
        decodedY = entropy_decode(encodedY, HEIGHT, WIDTH, dict);
        decodedU = entropy_decode(encodedU, HEIGHT/2, WIDTH/2, dict);
        decodedV = entropy_decode(encodedV, HEIGHT/2, WIDTH/2, dict);

        % Write the decompressed frame
        fwrite(fidOut, decodedY', 'uint8');
        fwrite(fidOut, decodedU, 'uint8');
        fwrite(fidOut, decodedV, 'uint8');
    end

    % Close the files
    fclose(fidIn);
    fclose(fidOut);

    disp("Decompression complete. Output saved to " + outputFile);
end