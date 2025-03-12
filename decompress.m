function [decompY, decompU, decompV] = decompress(inputFile)
    fid = fopen(inputFile, 'r');

    % Read the image
    [qY, qU, qV] = yuv_readimage(fid);

    figure;
    subplot(1, 2, 1);
    imshow(uint8(qY), []);
    title('Y Component');

    subplot(1, 2, 2);
    imshow(uint8(idct2(qY)), []);
    title('Y Component');

    % Inverse Transform 
    decompY = idct2(qY);
    decompU = idct2(qU);
    decompV = idct2(qV);
end