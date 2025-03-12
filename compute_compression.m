function [compressionRatio, compressionRate] = compute_compression(inputFile, outputFile)
    originalSize = dir(inputFile).bytes;
    compressedSize = dir(outputFile).bytes;

    compressionRatio = originalSize / compressedSize;
    compressionRate = (1 - (compressedSize / originalSize)) * 100;

    % Display results
    fprintf("Original size: %d bytes\n", originalSize);
    fprintf("Compressed size: %d bytes\n", compressedSize);
    fprintf("Compression Ratio: %.2f\n", compressionRatio);
    fprintf("Compression Rate: %.2f%%\n", compressionRate);
end