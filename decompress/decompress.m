function decompress(inputFile, outputFile, dict, L)
    run('config.m');

    % Open the files
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');

    for i = 1:NB_FRAME
        % Read the encoded frame (Y, U, V)
        [encodedY, encodedU, encodedV] = read_bitstream(fidIn);

        % Decode the frame
        qY = entropy_decode(encodedY, DCT_WIDTH, DCT_HEIGHT_Y, dict);
        qU = entropy_decode(encodedU, DCT_WIDTH, DCT_HEIGHT_UV, dict);
        qV = entropy_decode(encodedV, DCT_WIDTH, DCT_HEIGHT_UV, dict);

        % Apply dequantization
        [dctY, dctU, dctV] = apply_dequantization(qY, qU, qV, L);

        % Apply inverse DCT
        [compY, compU, compV] = apply_idct(dctY, dctU, dctV);

        % Write the decompressed frame
        fwrite(fidOut, compY', 'uint8');
        fwrite(fidOut, compU, 'uint8');
        fwrite(fidOut, compV, 'uint8');
    end

    % Close the files
    fclose(fidIn);
    fclose(fidOut);

    disp("Decompression complete. Output saved to " + outputFile);
end