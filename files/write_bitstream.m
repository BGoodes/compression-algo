% function write_bitstream(fid, compY, compU, compV, type)
%
% Write the bitstream to a file
% Inputs:
%   fid : File id obtained from an fopen
%   encodedY, encodedY, encodedV : YUV encoded components
%
function write_bitstream(fid, encodedY, encodedU, encodedV)
    write_component(fid, encodedY);
    write_component(fid, encodedU);
    write_component(fid, encodedV);
end

function write_component(fid, encoded)
    % Write the length of the encoded data
    fwrite(fid, length(encoded), 'uint32');
    
    % Write the encoded data
    fwrite(fid, encoded, 'ubit1');
end
