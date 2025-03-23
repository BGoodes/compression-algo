clear; 
run('config.m');

N = 64;
L = 50;

dict = create_huffman_dict(INPUT_FILE, N, L);

compress(INPUT_FILE, COMPRESSED_FILE, dict, N, L);
decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict, L);

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