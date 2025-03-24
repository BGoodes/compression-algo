function dict = create_huffman_dict(inputFile, N, L)
    run('config.m');

    fidIn = fopen(inputFile, 'r');
    
    allSymbols = [];

    for i = 1:NB_FRAME
        [compY, compU, compV] = yuv_readimage(fidIn);
        [centeredY, centeredU, centeredV] = center(compY, compU, compV);
        [dctY, dctU, dctV] = apply_dct(centeredY, centeredU, centeredV);
        [qY, qU, qV] = apply_quantization(dctY, dctU, dctV, N, L);

        allSymbols = [allSymbols; qY(:); qU(:); qV(:)];
    end
    
    fclose(fidIn);
    
    symbols = unique(allSymbols);
    counts = histcounts(allSymbols, [symbols; max(symbols) + 1]);
    prob = counts / sum(counts);
    
    dict = huffmandict(symbols, prob);
    disp("Huffman dictionary created.");
end
