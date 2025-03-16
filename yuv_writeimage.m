% function yuv_writeimage(compY, compU, compV)
%
% Writes a qcif image in yuv format
% Inputs:
%    compY, compU et compV : YUV components of the image
%
function yuv_writeimage(fid, compY, compU, compV, type)
    arguments
        fid
        compY
        compU
        compV
        type {mustBeMember(type, {'uint8', 'uint16'})} = 'uint8'
    end

    % Write the components
    fwrite(fid, compY', type);
    fwrite(fid, compU, type);
    fwrite(fid, compV, type);
end