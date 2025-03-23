clear; 
run('config.m');

dict = create_huffman_dict(INPUT_FILE);

compress(INPUT_FILE, COMPRESSED_FILE, dict);
decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict);

compute_compression(INPUT_FILE, COMPRESSED_FILE);

[compY1, compU1, compV1] = yuv_readimage(fopen(INPUT_FILE, 'r'));
[compY2, compU2, compV2] = yuv_readimage(fopen(DECOMPRESSED_FILE, 'r'));

% Display
figure;
subplot(2, 2, 1);
imshow(uint8(compY1), []);
title('Image originale');

subplot(2, 2, 2);
imshow(uint8(compY2), []);
title('Image décompressée');