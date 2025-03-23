function avg_psnr = compute_average_psnr(inputFile, outputFile)
    run("config.m");

    fidIn = fopen(inputFile, 'r');
    fidOut = fopen(outputFile, 'r');
    
    avg_psnr = 0;

    % Read the frames
    for i = 1:NB_FRAME
        [compY1, compU1, compV1] = yuv_readimage(fidIn);
        [compY2, compU2, compV2] = yuv_readimage(fidOut);

        % Compute PSNR
        psnrY = compute_psnr(compY1, compY2);
        psnrU = compute_psnr(compU1, compU2);
        psnrV = compute_psnr(compV1, compV2);

        avg_psnr = avg_psnr + (psnrY + psnrU + psnrV) / 3;
    end

    avg_psnr = avg_psnr / NB_FRAME;
    fprintf("Average PSNR: %f dB\n", avg_psnr);
end

function psnr = compute_psnr(orig, distorted)
    mse = mean((double(orig) - double(distorted)).^2, 'all');
    if mse == 0
        psnr = Inf;
    else
        max_value = 255.0;
        psnr = 10 * log10((max_value^2) / mse);
    end
end