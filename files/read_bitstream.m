% function read_bitstream(fid, type)
% 
% Read the bitstream from a file
% Inputs:
%   fid : File id obtained from an fopen
%
% Outputs:
%   qY, qU, qV : YUV quantized components
%
function [qY, qU, qV] = read_bitstream(fid, type)
    arguments
        fid
        type {mustBeMember(type, {'int8', 'int16', 'int32'})} = 'int8'
    end

    run('config.m');

    % Read the bitstream
    qY = fread(fid, [BITSTREAM_HEIGHT BITSTREAM_WIDTH], type);
    qY = qY';
    qU = fread(fid, [BITSTREAM_HEIGHT/2 BITSTREAM_WIDTH/2], type);
    qV = fread(fid, [BITSTREAM_HEIGHT/2 BITSTREAM_WIDTH/2], type);
end