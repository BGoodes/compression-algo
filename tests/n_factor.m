clear;
run('config.m');

N_values = [1, 10, 20, 30, 40, 50];

num_images = length(N_values);
num_cols = ceil(sqrt(num_images));
num_rows = ceil(num_images / num_cols);

figure('Name', 'Comparaison des compressions', 'NumberTitle', 'off', 'Color', 'w');
set(gcf, 'Position', [100, 100, 800, 600]);

t = tiledlayout(num_rows, num_cols, 'TileSpacing', 'compact', 'Padding', 'compact');

for i = 1:num_images
    N = N_values(i);
    
    dict = create_huffman_dict(INPUT_FILE, N);
    compress(INPUT_FILE, COMPRESSED_FILE, dict, N);
    decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict);

    psnr_val = compute_average_psnr(INPUT_FILE, DECOMPRESSED_FILE);
    fprintf('N = %d, PSNR = %.2f dB\n', N, psnr_val);

    fidOut = fopen(DECOMPRESSED_FILE, 'r');
    [compY_decomp, ~, ~] = yuv_readimage(fidOut);
    fclose(fidOut);

    nexttile;
    imshow(uint8(compY_decomp), []);
    title(sprintf('N = %d\nPSNR = %.2f dB', N, psnr_val), 'FontSize', 10);
end