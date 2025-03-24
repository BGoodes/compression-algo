function decompress(inputFile, outputFile, dict, L)
    run('config.m');

    % Open the files
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');

    for i = 1:NB_FRAME
        % Read the encoded frame (Y, U, V)
        [encodedY, encodedU, encodedV] = read_bitstream(fidIn);

        % Decode the frame
        [qY, qU, qV] = entropy_decode(encodedY, encodedU, encodedV, dict);

        % Apply dequantization
        [dctY, dctU, dctV] = apply_dequantization(qY, qU, qV, L);

        % Apply inverse DCT
        [centeredY, centeredU, centeredV] = apply_idct(dctY, dctU, dctV);

        % Decenter
        % [compY, compU, compV] = decenter(centeredY, centeredU, centeredV);

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