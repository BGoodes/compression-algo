clear;
run('config.m');

L_values = 1:256;
N = 64;
psnr_values = zeros(1, length(L_values));

for i = 1:length(L_values)
    L = L_values(i);
    
    dict = create_huffman_dict(INPUT_FILE, N, L);
    compress(INPUT_FILE, COMPRESSED_FILE, dict, N, L);
    decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict, L);
    
    psnr_values(i) = compute_average_psnr(INPUT_FILE, DECOMPRESSED_FILE);
    fprintf('L = %d, PSNR = %.2f dB\n', L, psnr_values(i));
end

figure('Name', 'PSNR en fonction de L', 'NumberTitle', 'off', 'Color', 'w');
plot(L_values, psnr_values, 'r-', 'LineWidth', 2);
xlabel('L');
ylabel('PSNR (dB)');
title('PSNR en fonction de L');
grid on;