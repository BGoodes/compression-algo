function compress(inputFile, outputFile, dict)
    run('config.m');

    % Open the file
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');
    
    for i = 1:NB_FRAME
        % Read the frame
        [compY, compU, compV] = yuv_readimage(fidIn);

        % Encode the frame
        encodedY = entropy_encode(compY, dict);
        encodedU = entropy_encode(compU, dict);
        encodedV = entropy_encode(compV, dict);

        % Write the frame
        write_bitstream(fidOut, encodedY, encodedU, encodedV);
    end

    % Close the file
    fclose(fidIn);
    fclose(fidOut);

    disp("Compression complete. Bitstream saved to " + outputFile);
end
