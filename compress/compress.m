function [qY, qU, qV] = compress(inputFile, outputFile)
    run('config.m');

    % Open the file
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');
    
    for i = 1:NB_FRAME
        % Read the frame
        [compY, compU, compV] = yuv_readimage(fidIn);

        % Apply DCT
        [dctY, dctU, dctV] = apply_transform(compY, compU, compV);

        % Quantization
        [qY, qU, qV] = apply_quantization(dctY, dctU, dctV);
        
        % Write the frame
        write_bitstream(fidOut, qY, qU, qV, 'int16');
    end

    % Close the file
    fclose(fidIn);
    fclose(fidOut);

    disp("Compression complete. Bitstream saved to " + outputFile);
end
