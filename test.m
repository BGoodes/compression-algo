clear;

% Parameters
inputFolder = 'media/originals';
outputFolder = 'media/generated';

if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

files = dir(fullfile(inputFolder, '*.qcif'));

compressionRatios = zeros(1, length(files));
compressionRates = zeros(1, length(files));

for i = 1:length(files)

    inputFile = fullfile(inputFolder, files(i).name);
    [~, name, ~] = fileparts(files(i).name);
    outputFile = fullfile(outputFolder, name + "_compressed.qcif");

    fprintf("Compressing %s\n", inputFile);
    dict = create_huffman_dict(inputFile);
    compress(inputFile, outputFile, dict);
    
    % Compute compression ratio and rate
    [compressionRatios(i), compressionRates(i)] = compute_compression(inputFile, outputFile);
end

% Display
figure;
bar(compressionRates);
xticks(1:length(files));
xticklabels({files.name});
xtickangle(45);
ylabel('Taux de Compression (%)');
title('Taux de Compression MEH');
grid on;

dip('Compression complete for all files');
