% function read_bitstream(fid)
%
% Read the bitstream from a file
% Inputs:
%   fid : File id obtained from an fopen
%
% Outputs:
%   encodedY, encodedY, encodedV : YUV encoded components
%
function [encodedY, encodedU, encodedV] = read_bitstream(fid)
    encodedY = read_component(fid);
    encodedU = read_component(fid);
    encodedV = read_component(fid);
end

function encoded = read_component(fid)
    % Read the length of the encoded data
    lengthEncoded = fread(fid, 1, 'uint32');
    
    % Read the encoded data
    encoded = fread(fid, lengthEncoded, 'ubit1');
end
