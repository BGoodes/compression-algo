function [dictI, dictP] = create_huffman_dict(inputFile, N, L)
    run('config.m');

    fidIn = fopen(inputFile, 'r');
    
    allSymbolsI = [];
    allSymbolsP = [];

    refY = zeros(HEIGHT, WIDTH);
    refU = zeros(HEIGHT / 2, WIDTH / 2);
    refV = zeros(HEIGHT / 2, WIDTH / 2);

    % TODO Bad practice : duplicate code
    for i = 1:NB_FRAME
        [compY, compU, compV] = yuv_readimage(fidIn);

        [centeredY, centeredU, centeredV] = center(compY, compU, compV);
        [dctY, dctU, dctV] = apply_dct(centeredY, centeredU, centeredV);
        [qY, qU, qV] = apply_quantization(dctY, dctU, dctV, N, L);
        [rleY, rleU, rleV] = apply_rle(qY, qU, qV);

        allSymbolsI = [allSymbolsI; rleY(:); rleU(:); rleV(:)];


        if i > 1
            [motionVectY, ~] = motionEstDS(refY, compY, MB_SIZE, P);
            [motionVectU, ~] = motionEstDS(refU, compU, MB_SIZE/2, P);
            [motionVectV, ~] = motionEstDS(refV, compV, MB_SIZE/2, P);

            [rleY, rleU, rleV] = apply_rle(motionVectY, motionVectU, motionVectV);

            allSymbolsP = [allSymbolsP; rleY(:); rleU(:); rleV(:)];
        end

        refY = compY;
        refU = compU;
        refV = compV;
    end
    
    fclose(fidIn);
    
    symbolsI = unique(allSymbolsI);
    countsI = histcounts(allSymbolsI, [symbolsI; max(symbolsI) + 1]);
    probI = countsI / sum(countsI);
    
    dictI = huffmandict(symbolsI, probI);
    disp("Huffman I dictionary created.");

    if isempty(allSymbolsP)
        dictP = [];
        return;
    end

    symbolsP = unique(allSymbolsP);
    countsP = histcounts(allSymbolsP, [symbolsP; max(symbolsP) + 1]);
    probP = countsP / sum(countsP);
    
    dictP = huffmandict(symbolsP, probP);
    disp("Huffman P dictionary created.");
end
