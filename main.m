clear; 
run('config.m');

dict = create_huffman_dict(INPUT_FILE);

compress(INPUT_FILE, COMPRESSED_FILE, dict);
decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict);

compute_compression(INPUT_FILE, COMPRESSED_FILE);

[compY, compU, compV] = yuv_readimage(fopen(DECOMPRESSED_FILE, 'r'));

% Display
figure;
imshow(uint8(compY), []);
title('Image décompressée');