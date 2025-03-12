function [decompY, decompU, decompV] = decompress(inputFile)
    run('config.m');

    % Open the file
    fid = fopen(inputFile, 'r');

    for i = 1:NB_FRAME
        % Read the frame
        [qY, qU, qV] = yuv_readimage(fid);

        % Inverse Transform 
        decompY = idct2(qY);
        decompU = idct2(qU);
        decompV = idct2(qV);
    end

    % Close the file
    fclose(fid);

    disp("Decompression complete.");
end