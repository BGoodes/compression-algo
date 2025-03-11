% Filename
file = "./media/news.qcif";
width = 176;
height = 144;

% Open the file
fid = fopen(file,'r');

fileBytes = dir(file).bytes;
nbImage = fileBytes/(width*height + 2*(width/2)*(height/2));

% Load an image.
[compY,compU,compV]=yuv_readimage(fid);

% Apply DCT
[dctY,dctU,dctV]=apply_transform(compY,compU,compV);

% Display
figure;
subplot(1, 2, 1);
imshow(compY, []);
title('Y Component');

subplot(1, 2, 2);
imshow(log(abs(dctY) + 1), []);
title('DCT of Y');

% Close the file
fclose(fid);