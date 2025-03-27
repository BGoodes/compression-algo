function [compY, compU, compV] = reconstruct_frame(fidIn, fidOut, refY, refU, refV, dictP)
    run('config.m');

    % Read the current frame
    [motionVectY, motionVectU, motionVectV] = read_bitstream(fidIn);

    motionVectY = reshape(motionVectY, [2, 99]);    
    motionVectU = reshape(motionVectU, [2, 99]);
    motionVectV = reshape(motionVectV, [2, 99]);

    % Motion compensation
    compY = motionComp(refY, motionVectY, MB_SIZE);
    compU = motionComp(refU, motionVectU, MB_SIZE/2);
    compV = motionComp(refV, motionVectV, MB_SIZE/2);

    % Write the reconstructed frame
    fwrite(fidOut, compY', 'uint8');
    fwrite(fidOut, compU, 'uint8');
    fwrite(fidOut, compV, 'uint8');
end