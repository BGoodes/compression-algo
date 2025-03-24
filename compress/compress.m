function compress(inputFile, outputFile, dict, N, L)
    run('config.m');

    % Open the file
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');
    
    for i = 1:NB_FRAME
        % Read the frame
        [compY, compU, compV] = yuv_readimage(fidIn);

        % Apply DCT
        [dctY, dctU, dctV] = apply_dct(compY, compU, compV);

        % Apply quantization
        [qY, qU, qV] = apply_quantization(dctY, dctU, dctV, N, L);

        % Encode the frame
        [encodedY, encodedU, encodedV] = entropy_encode(qY, qU, qV, dict);

        % Write the frame
        write_bitstream(fidOut, encodedY, encodedU, encodedV);
    end

    % Close the file
    fclose(fidIn);
    fclose(fidOut);

    disp("Compression complete. Bitstream saved to " + outputFile);
end
