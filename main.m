clear; 
run('config.m');

compress(INPUT_FILE, COMPRESSED_FILE);
decompress(COMPRESSED_FILE, DECOMPRESSED_FILE);

compute_compression(INPUT_FILE, COMPRESSED_FILE);