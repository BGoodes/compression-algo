run('config.m');

% Parameters
mbSize = 16;
p = 7;
S = 5;

fidIn = fopen(INPUT_FILE, 'r');

figure;

for i = 1:S
    [compY1, ~, ~] = yuv_readimage(fidIn);
    [compY2, ~, ~] = yuv_readimage(fidIn);

    [motionVect, ~] = motionEstES(compY1, compY2, mbSize, p);
    imgComp = motionComp(compY1, motionVect, mbSize);

    subplot(2, S, i);
    imshow(uint8(imgComp), []);
    title(['Prédite ', num2str(i)]);

    subplot(2, S, i + S);
    imshow(uint8(compY2), []);
    title(['Originale ', num2str(i)]);
end

fclose(fidIn);