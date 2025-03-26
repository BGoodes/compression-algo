function decompress_frame(fidIn, fidOut, dict, L)
    run('config.m');

    % Read the encoded frame (Y, U, V)
    [encodedY, encodedU, encodedV] = read_bitstream(fidIn);

    % Decode the frame
    [rleY, rleU, rleV] = entropy_decode(encodedY, encodedU, encodedV, dict);

    % Decode RLE
    [qY, qU, qV] = reverse_rle(rleY, rleU, rleV);

    % Apply L dequantization
    [dctY, dctU, dctV] = apply_dequantization(qY, qU, qV, L);

    % Apply inverse DCT
    [centeredY, centeredU, centeredV] = apply_idct(dctY, dctU, dctV);

    % Decenter
    [compY, compU, compV] = decenter(centeredY, centeredU, centeredV);

    % Write the decompressed frame
    fwrite(fidOut, compY', 'uint8');
    fwrite(fidOut, compU, 'uint8');
    fwrite(fidOut, compV, 'uint8');
end