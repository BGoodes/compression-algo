inputFile = 'media/originals/carphone.qcif';

fidIn = fopen(inputFile, 'r');
[compY, compU, compV] = yuv_readimage(fidIn);

% Display
figure;
imshow(uint8(compY), []);
title('Image originale');