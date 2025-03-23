function dict = create_huffman_dict(inputFile)
    run('config.m');

    fidIn = fopen(inputFile, 'r');
    
    allSymbols = [];

    for i = 1:NB_FRAME
        [compY, compU, compV] = yuv_readimage(fidIn);
        allSymbols = [allSymbols; compY(:); compU(:); compV(:)];
    end
    
    fclose(fidIn);
    
    symbols = unique(allSymbols);
    counts = histcounts(allSymbols, [symbols; max(symbols) + 1]);
    prob = counts / sum(counts);
    
    dict = huffmandict(symbols, prob);
    disp("Huffman dictionary created.");
end
