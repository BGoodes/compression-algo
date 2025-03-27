clear; 
run('config.m');

% Parameters
N = 35;
L = 10;
S = 2; % Number of P images between 2 I images

% Compression
fidIn = fopen(INPUT_FILE, 'r');
fidOut = fopen(COMPRESSED_FILE, 'w');

[dictI, dictP] = create_huffman_dict(INPUT_FILE, N, L);

refY = zeros(HEIGHT, WIDTH);
refU = zeros(HEIGHT / 2, WIDTH / 2);
refV = zeros(HEIGHT / 2, WIDTH / 2);

for i = 1:NB_FRAME
    disp(i)
    if mod(i-1, S) == 0 % I frame
        [compY, compU, compV] = compress_frame(fidIn, fidOut, dictI, N, L);
    else % P frame
        [compY, compU, compV] = predict_frame(fidIn, fidOut, refY, refU, refV, dictP);
    end

    refY = compY;
    refU = compU;
    refV = compV;
end

fclose(fidIn);
fclose(fidOut);

disp("------------------");

% Decompression
fidIn = fopen(COMPRESSED_FILE, 'r');
fidOut = fopen(DECOMPRESSED_FILE, 'w');

refY = zeros(HEIGHT, WIDTH);
refU = zeros(HEIGHT / 2, WIDTH / 2);
refV = zeros(HEIGHT / 2, WIDTH / 2);

for i = 1:NB_FRAME
    disp(i)
    if mod(i-1, S) == 0 % I frame
        [compY, compU, compV] = decompress_frame(fidIn, fidOut, dictI, L);
    else % P frame
        [compY, compU, compV] = reconstruct_frame(fidIn, fidOut, refY, refU, refV, dictP);
    end
    
    refY = compY;
    refU = compU;
    refV = compV;
end

fclose(fidIn);
fclose(fidOut);

compute_compression(INPUT_FILE, COMPRESSED_FILE);
% compute_average_psnr(INPUT_FILE, DECOMPRESSED_FILE);

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