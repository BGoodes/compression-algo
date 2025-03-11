% Filename
file = "./media/news.qcif";
width = 176;
height = 144;

fileBytes = dir(file).bytes;
nbImage = fileBytes/(width*height + 2*(width/2)*(height/2));

compress(file, "test.mat")
[decompY, decompU, decompV]=decompress("test.mat");

% Display
figure;
subplot(1, 2, 1);
imshow(compY, []);
title('Y Component');

subplot(1, 2, 2);
imshow(decompY, []);
title('Y Component');