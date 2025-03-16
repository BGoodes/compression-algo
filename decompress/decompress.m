function [decompY, decompU, decompV] = decompress(inputFile)
    run('config.m');

    % Open the file
    fid = fopen(inputFile, 'r');

    for i = 1:NB_FRAME
        % Read the frame
        [qY, qU, qV] = read_bitstream(fid, 'int16');   
        disp(size(qY));

        % Dequantization
        [dctY, dctU, dctV] = reverse_quantization(qY, qU, qV);

        % Apply inverse DCT
        [decompY, decompU, decompV] = reverse_transform(dctY, dctU, dctV);
    end

    assignin('base', 'qY', qY);

    % Close the file
    fclose(fid);

    disp("Decompression complete.");
end