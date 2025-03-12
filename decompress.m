function [decompY, decompU, decompV] = decompress(inputFile)
    run('config.m');

    % Open the file
    fid = fopen(inputFile, 'r');

    for i = 1:NB_FRAME
        % Read the frame
        [qY, qU, qV] = yuv_readimage(fid);

        % Dequantization
        [dctY, dctU, dctV] = reverse_quantization(qY, qU, qV);

        % Apply inverse DCT
        [decompY, decompU, decompV] = reverse_transform(dctY, dctU, dctV);
    end

    % Close the file
    fclose(fid);

    disp("Decompression complete.");
end