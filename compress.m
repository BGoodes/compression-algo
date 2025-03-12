function [qY, qU, qV] = compress(inputFile, outputFile)
    fid = fopen(inputFile, 'r');

    % Read the image
    [compY, compU, compV] = yuv_readimage(fid);

    % Apply DCT
    [dctY, dctU, dctV] = apply_transform(compY, compU, compV);

    % Quantization
    [qY, qU, qV] = apply_quantization(dctY, dctU, dctV);

    % Save bitstream
    save(outputFile, 'qY', 'qU', 'qV');

    % Close the file
    fclose(fid);
    disp("Compression complete. Bitstream saved to " + outputFile);
end
