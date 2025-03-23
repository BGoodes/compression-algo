function compress(inputFile, outputFile)
    run('config.m');

    % Open the file
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');
    
    for i = 1:NB_FRAME
        % Read the frame
        [compY, compU, compV] = yuv_readimage(fidIn);

        % Encode the frame
        encodedY = entropy_encode(compY);
        encodedU = entropy_encode(compU);
        encodedV = entropy_encode(compV);

        % Write the frame
        write_bitstream(fidOut, encodedY, encodedU, encodedV);
    end

    % Close the file
    fclose(fidIn);
    fclose(fidOut);

    disp("Compression complete. Bitstream saved to " + outputFile);
end
