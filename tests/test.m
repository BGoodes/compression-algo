clear;
run('config.m');

% Parameters
inputFolder = 'media/originals';
outputFolder = 'media/generated';

N = 35;
L = 10;
S = 2; % Number of P images between 2 I images (don't work when S>2)

if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

files = dir(fullfile(inputFolder, '*.qcif'));

compressionRatios = zeros(1, length(files));
compressionRates = zeros(1, length(files));
compressionTimes = zeros(1, length(files));

for i = 1:length(files)
    inputFile = fullfile(inputFolder, files(i).name);
    [~, name, ~] = fileparts(files(i).name);
    outputFile = fullfile(outputFolder, name + "_compressed.meh");
    decompressedFile = fullfile(outputFolder, name + "_decompressed.qcif");

    fprintf("Compressing %s\n", inputFile);
    
    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'w');

    [dictI, dictP] = create_huffman_dict(inputFile, N, L);

    refY = zeros(HEIGHT, WIDTH);
    refU = zeros(HEIGHT / 2, WIDTH / 2);
    refV = zeros(HEIGHT / 2, WIDTH / 2);

    tic;
    for frameIdx = 1:NB_FRAME
        [compY, compU, compV] = yuv_readimage(fidIn);

        if mod(frameIdx - 1, S) == 0
            compress_frame(compY, compU, compV, fidOut, dictI, N, L);
        else
            predict_frame(compY, compU, compV, fidOut, refY, refU, refV, dictP);
        end

        refY = compY;
        refU = compU;
        refV = compV;
    end
    compressionTimes(i) = toc;

    fclose(fidIn);
    fclose(fidOut);

    [compressionRatios(i), compressionRates(i)] = compute_compression(inputFile, outputFile);

    fidIn = fopen(outputFile, 'r');
    fidOut = fopen(decompressedFile, 'w');

    refY = zeros(HEIGHT, WIDTH);
    refU = zeros(HEIGHT / 2, WIDTH / 2);
    refV = zeros(HEIGHT / 2, WIDTH / 2);

    for frameIdx = 1:NB_FRAME
        if mod(frameIdx - 1, S) == 0
            [compY, compU, compV] = decompress_frame(fidIn, fidOut, dictI, L);
        else
            [compY, compU, compV] = reconstruct_frame(fidIn, fidOut, refY, refU, refV, dictP);
        end

        refY = compY;
        refU = compU;
        refV = compV;
    end

    fclose(fidIn);
    fclose(fidOut);

    % psnrValues(i) = compute_average_psnr(inputFile, decompressedFile);
    
    fprintf("File: %s | Compression Time: %.4f s | Compression Rate: %.2f%%\n", ...
        files(i).name, compressionTimes(i), compressionRates(i));
end

figure;
bar(compressionRates);
xticks(1:length(files));
xticklabels({files.name});
xtickangle(45);
ylabel('Taux de Compression (%)');
title('Taux de Compression MEH');
grid on;

disp('Compression complete for all files');
