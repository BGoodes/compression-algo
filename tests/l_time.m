clear;
run('config.m');

% Parameters
L_values = 1:100;
N = 64;
time_values = zeros(1, length(L_values));

for i = 1:length(L_values)
    L = L_values(i);
    
    tic;
    
    dict = create_huffman_dict(INPUT_FILE, N, L);
    compress(INPUT_FILE, COMPRESSED_FILE, dict, N, L);
    decompress(COMPRESSED_FILE, DECOMPRESSED_FILE, dict, L);
    
    time_values(i) = toc;
    
    fprintf('L = %d, Temps = %.4f secondes\n', L, time_values(i));
end

% Affichage des résultats
figure('Name', 'Temps de compression/décompression en fonction de L', 'NumberTitle', 'off', 'Color', 'w');
plot(L_values, time_values, 'g-', 'LineWidth', 2);
xlabel('L');
ylabel('Temps (secondes)');
title('Vitesse du cycle compression/décompression en fonction de L');
grid on;
