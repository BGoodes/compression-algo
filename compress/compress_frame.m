function compress_frame(fidIn, fidOut, dict, N, L)
    run('config.m');
    
    % Read the frame
    [compY, compU, compV] = yuv_readimage(fidIn);

    % Center
    [centeredY, centeredU, centeredV] = center(compY, compU, compV);

    % Apply DCT 8x8
    [dctY, dctU, dctV] = apply_dct(centeredY, centeredU, centeredV);

    % Apply L quantization & N decimation
    [qY, qU, qV] = apply_quantization(dctY, dctU, dctV, N, L);

    % Apply RLE
    [rleY, rleU, rleV] = apply_rle(qY, qU, qV);

    % Encode the frame (Huffman)
    [encodedY, encodedU, encodedV] = entropy_encode(rleY, rleU, rleV, dict);

    % Write the frame
    write_bitstream(fidOut, encodedY, encodedU, encodedV);
end
