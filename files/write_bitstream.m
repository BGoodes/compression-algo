% function write_bitstream(fid, compY, compU, compV, type)
%
% Write the bitstream to a file
% Inputs:
%   fid : File id obtained from an fopen
%   compY, compU, compV : YUV quantized components
%   type : The type of the bitstream (default: uint8)
%
function write_bitstream(fid, compY, compU, compV, type)
    arguments
        fid
        compY
        compU
        compV
        type {mustBeMember(type, {'int8', 'int16', 'int32'})} = 'int8'
    end

    % Write the bitstream
    fwrite(fid, compY', type);
    fwrite(fid, compU, type);
    fwrite(fid, compV, type);
end