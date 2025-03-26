clear;
run('config.m');

N_values = 1:60;
L = 1;
psnr_values = zeros(1, length(N_values));
compression_ratios = zeros(1, length(N_values));  

for i = 1:length(N_values)
    N = N_values(i);
    
    dict = create_huffman_dict(INPUT_FILE, N, L);

    compress(INPUT_FILE, COMPRESSED_FILE, dict, N, L);
    decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict, L);

    psnr_values(i) = compute_average_psnr(INPUT_FILE, DECOMPRESSED_FILE);
    
    [compression_ratio, ~] = compute_compression(INPUT_FILE, COMPRESSED_FILE);
    compression_ratios(i) = compression_ratio;
    
    fprintf('N = %d, PSNR = %.2f dB, Compression Ratio = %.2f\n', N, psnr_values(i), compression_ratio);
end

figure('Name', 'PSNR en fonction du taux de compression', 'NumberTitle', 'off', 'Color', 'w');
plot(compression_ratios, psnr_values, 'b-', 'LineWidth', 2);
xlabel('Taux de Compression');
ylabel('PSNR (dB)');
title('PSNR en fonction du taux de compression (N variable, L=1)');
grid on;