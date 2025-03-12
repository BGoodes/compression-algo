% function yuv_writeimage(compY, compU, compV)
%
% Writes a qcif image in yuv format
% Inputs:
%    compY, compU et compV : YUV components of the image
%
function yuv_writeimage(fid, compY, compU, compV)

    % Write the components
    fwrite(fid, compY', 'uint8');
    fwrite(fid, compU, 'uint8');
    fwrite(fid, compV, 'uint8');
end