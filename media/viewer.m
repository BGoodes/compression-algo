run("config.m")

inputFile = 'media/generated/test.qcif';
fidIn = fopen(inputFile, 'r');

figure;
while ~feof(fidIn)

    [compY, ~, ~] = yuv_readimage(fidIn);

    if isempty(compY)
        break;
    end

    resizedImage = imresize(uint8(compY), [HEIGHT*5, WIDTH*5]);

    borderSize = round(min(HEIGHT, WIDTH) * 0.04);
    borderedImage = padarray(resizedImage, [borderSize, borderSize], 255, 'both');

    imshow(borderedImage, []);
    title('Lecture vidéo YUV');
end

fclose(fidIn);
disp('Lecture terminée.');
