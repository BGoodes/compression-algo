% Filename
file = "./media/news.qcif";
width = 176;
height = 144;

fileSize = dir(file).bytes;
nbImage = fileSize/(width*height + width*height/2);

compress(file, "test.mat")
[decompY, decompU, deompV]=decompress("test.mat");

compute_compression(file, "test.mat");

% Display
figure;
imshow(decompY, []);
title('Y Component');