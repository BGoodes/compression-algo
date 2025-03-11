function [decompY, decompU, decompV] = decompress(bitstreamFile)
    load(bitstreamFile, 'qY', 'qU', 'qV');
    
    % Inverse Transform 
    decompY = idct2(qY);
    decompU = idct2(qU);
    decompV = idct2(qV);
end