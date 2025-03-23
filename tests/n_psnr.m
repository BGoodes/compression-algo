clear;
run('config.m');

N_values = 1:100;
psnr_values = zeros(1, length(N_values));

for i = 1:length(N_values)
    N = N_values(i);
    
    dict = create_huffman_dict(INPUT_FILE, N);
    compress(INPUT_FILE, COMPRESSED_FILE, dict, N);
    decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict);
    
    psnr_values(i) = compute_average_psnr(INPUT_FILE, DECOMPRESSED_FILE);
    fprintf('N = %d, PSNR = %.2f dB\n', N, psnr_values(i));
end

figure('Name', 'PSNR en fonction de N', 'NumberTitle', 'off', 'Color', 'w');
plot(N_values, psnr_values, 'b-', 'LineWidth', 2);
xlabel('N');
ylabel('PSNR (dB)');
title('PSNR en fonction de N');
grid on;