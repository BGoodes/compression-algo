file = "./media/news.qcif";

fidIn = fopen(file, 'r');
fidOut = fopen("test.mat", 'w');
fidCopy = fopen("test.mat", 'r');

% Read the image
[compY, compU, compV] = yuv_readimage(fidIn);

% Write the image
yuv_writeimage(fidOut, compY, compU, compV);
save("test2.mat", 'compY', 'compU', 'compV', "-nocompression");

% Read the image
[compY2, compU2, compV2] = yuv_readimage(fidCopy);

% Close the files
fclose(fidIn);
fclose(fidOut);
fclose(fidCopy);

% Display
figure;
subplot(1, 2, 1);
imshow(compY, []);

subplot(1, 2, 2);
imshow(compY2, []);

% Compare sizes of bitstreams
originalSize = dir(file).bytes/300;
copySize = dir("test.mat").bytes;
copy2Size = dir("test2.mat").bytes;

disp("Original size: " + originalSize);
disp("Copy size: " + copySize);
disp("Copy2 size: " + copy2Size);