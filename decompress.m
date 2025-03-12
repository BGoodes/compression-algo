function [decompY, decompU, decompV] = decompress(inputFile)
    % Load the bitstream
    load(inputFile, 'qY', 'qU', 'qV');

    % Inverse Transform 
    decompY = idct2(qY);
    decompU = idct2(qU);
    decompV = idct2(qV);
end