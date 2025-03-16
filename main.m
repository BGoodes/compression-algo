clear; 
run('config.m');

compress(INPUT_FILE, OUTPUT_FILE)
[decompY, decompU, decompV]=decompress(OUTPUT_FILE);

compute_compression(INPUT_FILE, OUTPUT_FILE);

% Display
figure;
imshow(uint8(decompY), []);
title('Image récupérée du bitstream');