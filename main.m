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

% Quantization
[qY, qU, qV] = apply_quantization(dctY, dctU, dctV);

% Inverse Transform 
decompY = idct2(qY);
decompU = idct2(qU);
decompV = idct2(qV);

% Display
figure;
subplot(1, 2, 1);
imshow(compY, []);
title('Y Component');

subplot(1, 2, 2);
imshow(decompY, []);
title('Y Component');

figure;
subplot(1, 2, 1);
imshow(dctY, []);
title('DCT of Y');

subplot(1, 2, 2);
imshow(qY, []);
title('Quantized Y');

% Close the file
fclose(fid);