function predict_frame(compY, compU, compV, fidOut, refY, refU, refV, dictP)
    run('config.m');
    
    % Motion estimation
    [motionVectY, ~] = motionEstDS(refY, compY, MB_SIZE, P);
    [motionVectU, ~] = motionEstDS(refU, compU, MB_SIZE/2, P);
    [motionVectV, ~] = motionEstDS(refV, compV, MB_SIZE/2, P);
    
    % Write to output file
    write_bitstream(fidOut, motionVectY(:)', motionVectU(:)', motionVectV(:)');
end
