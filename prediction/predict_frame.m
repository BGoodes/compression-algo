function [compY, compU, compV] = predict_frame(fidIn, fidOut, refY, refU, refV, dictP)
    run('config.m');

    % Read the current frame
    [compY, compU, compV] = yuv_readimage(fidIn);
    
    % Motion estimation
    [motionVectY, ~] = motionEstDS(refY, compY, MB_SIZE, P);
    [motionVectU, ~] = motionEstDS(refU, compU, MB_SIZE/2, P);
    [motionVectV, ~] = motionEstDS(refV, compV, MB_SIZE/2, P);

    disp(size(motionVectY));
    disp(size(motionVectU));
    disp(size(motionVectV));
    disp('----------');
    
    % Write to output file
    write_bitstream(fidOut, motionVectY(:), motionVectU(:), motionVectV(:));
end
