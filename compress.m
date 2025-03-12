function [qY, qU, qV] = compress(inputFile, outputFile)
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');

    % Read the image
    [compY, compU, compV] = yuv_readimage(fidIn);

    % Apply DCT
    [dctY, dctU, dctV] = apply_transform(compY, compU, compV);

    % Quantization
    [qY, qU, qV] = apply_quantization(dctY, dctU, dctV);
    
    % Save bitstream
    yuv_writeimage(fidOut, qY, qU, qV);

    % Close the file
    fclose(fidIn);
    fclose(fidOut);

    disp("Compression complete. Bitstream saved to " + outputFile);
end
