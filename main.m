clear; 
run('config.m');

% Parameters
N = 35;
L = 10;

% Compression
fidIn = fopen(INPUT_FILE, 'r');
fidOut = fopen(COMPRESSED_FILE, 'w');

dict = create_huffman_dict(INPUT_FILE, N, L);

for i = 1:NB_FRAME
    compress_frame(fidIn, fidOut, dict, N, L);
end

fclose(fidIn);
fclose(fidOut);

% Decompression
fidIn = fopen(COMPRESSED_FILE, 'r');
fidOut = fopen(DECOMPRESSED_FILE, 'w');

for i = 1:NB_FRAME
    decompress_frame(fidIn, fidOut, dict, L);
end

fclose(fidIn);
fclose(fidOut);

compute_compression(INPUT_FILE, COMPRESSED_FILE);
compute_average_psnr(INPUT_FILE, DECOMPRESSED_FILE);

[compY1, compU1, compV1] = yuv_readimage(fopen(INPUT_FILE, 'r'));
[compY2, compU2, compV2] = yuv_readimage(fopen(DECOMPRESSED_FILE, 'r'));

% Display
figure;
subplot(1, 2, 1);
imshow(uint8(compY1), []);
title('Image originale');

subplot(1, 2, 2);
imshow(uint8(compY2), []);
title('Image décompressée');