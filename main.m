% Filename
inputFile = "./media/news.qcif";
outputFile = "test.mat";

compress(inputFile, outputFile)
[decompY, decompU, decompV]=decompress(outputFile);

compute_compression(inputFile, outputFile);

% Display
figure;
imshow(uint8(decompY), []);
title('Y Component');