clear;

% Parameters
inputFolder = 'media/originals';
outputFolder = 'media/generated';

N = 35;
L = 10;

if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

files = dir(fullfile(inputFolder, '*.qcif'));

compressionRatios = zeros(1, length(files));
compressionRates = zeros(1, length(files));
psnrValues = zeros(1, length(files));
compressionTimes = zeros(1, length(files));

for i = 1:length(files)
    inputFile = fullfile(inputFolder, files(i).name);
    [~, name, ~] = fileparts(files(i).name);
    outputFile = fullfile(outputFolder, name + "_compressed.meh");
    decompressedFile = fullfile(outputFolder, name + "_decompressed.qcif");

    fprintf("Compressing %s\n", inputFile);
    
    % Start timing compression
    tic;
    dict = create_huffman_dict(inputFile, N, L);
    compress(inputFile, outputFile, dict, N, L);
    compressionTimes(i) = toc;
    
    % Compute compression ratio and rate
    [compressionRatios(i), compressionRates(i)] = compute_compression(inputFile, outputFile);
    
    % Decompress and compute PSNR
    decompress(outputFile, decompressedFile, dict, L);
    psnrValues(i) = compute_average_psnr(inputFile, decompressedFile);
    
    % Logs
    fprintf("File: %s | Compression Time: %.4f s | Compression Rate: %.2f%% | PSNR: %.2f dB\n", ...
        files(i).name, compressionTimes(i), compressionRates(i), psnrValues(i));
end

% Plot Compression Rates
figure;
bar(compressionRates);
xticks(1:length(files));
xticklabels({files.name});
xtickangle(45);
ylabel('Taux de Compression (%)');
title('Taux de Compression MEH');
grid on;

% Plot PSNR Values
figure;
bar(psnrValues, 'FaceColor', [0.2 0.6 1]);
xticks(1:length(files));
xticklabels({files.name});
xtickangle(45);
ylabel('PSNR (dB)');
title('PSNR après Compression');
grid on;

disp('Compression complete for all files');

