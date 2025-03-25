function compress(inputFile, outputFile, dict, N, L)
    run('config.m');

    % Open the file
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');
    
    for i = 1:NB_FRAME
        % Read the frame
        [compY, compU, compV] = yuv_readimage(fidIn);

        % Center
        [centeredY, centeredU, centeredV] = center(compY, compU, compV);

        % Apply DCT
        [dctY, dctU, dctV] = apply_dct(centeredY, centeredU, centeredV);

        % Apply quantization
        [qY, qU, qV] = apply_quantization(dctY, dctU, dctV, N, L);

        % Apply RLE
        [rleY, rleU, rleV] = apply_rle(qY, qU, qV);

        % Encode the frame (Huffman)
        [encodedY, encodedU, encodedV] = entropy_encode(rleY, rleU, rleV, dict);

        % Write the frame
        write_bitstream(fidOut, encodedY, encodedU, encodedV);
    end

    % Close the file
    fclose(fidIn);
    fclose(fidOut);

    disp("Compression complete. Bitstream saved to " + outputFile);
end
