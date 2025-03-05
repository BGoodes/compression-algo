% Filename
file = "./media/news.qcif";

% Open the file
fid = fopen(file,'r');

% Load an image in YUV format. To load the next image, apply the function again.
[compY,compU,compV]=yuv_readimage(fid);

% Show components
figure;
subplot(1,3,1);
imshow(uint8(compY));

subplot(1,3,2);
imshow(uint8(compU'));

subplot(1,3,3);
imshow(uint8(compV'));

% Close the file
fclose(fid);
