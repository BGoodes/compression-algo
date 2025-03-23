clear;
run('config.m');

L_values = [1, 4, 16, 32, 64, 128];
N = 64;

num_images = length(L_values);
num_cols = ceil(sqrt(num_images));
num_rows = ceil(num_images / num_cols);

figure('Name', 'Comparaison des compressions', 'NumberTitle', 'off', 'Color', 'w');
set(gcf, 'Position', [100, 100, 800, 600]);

t = tiledlayout(num_rows, num_cols, 'TileSpacing', 'compact', 'Padding', 'compact');

for i = 1:num_images
    L = L_values(i);
    
    dict = create_huffman_dict(INPUT_FILE, N, L);
    compress(INPUT_FILE, COMPRESSED_FILE, dict, N, L);
    decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict, L);

    psnr_val = compute_average_psnr(INPUT_FILE, DECOMPRESSED_FILE);
    fprintf('L = %d, PSNR = %.2f dB\n', L, psnr_val);

    fidOut = fopen(DECOMPRESSED_FILE, 'r');
    [compY_decomp, ~, ~] = yuv_readimage(fidOut);
    fclose(fidOut);

    nexttile;
    imshow(uint8(compY_decomp), []);
    title(sprintf('L = %d\nPSNR = %.2f dB', L, psnr_val), 'FontSize', 10);
end
