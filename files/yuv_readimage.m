% function [compY,compU,compV]=yuv_readimage(fid)
%
% Reads  a qcif image in yuv format
% Input:
%    fid: File id obtained from an fopen
%    type: Type of values to read
%
% Outputs:
%    compY, compU et compV : YUV components of the image
%
% Example:
% fid = fopen('foreman.qcif','r');
% [compY,compU,compV]=yuv_readimage(fid)

function [compY, compU, compV]=yuv_readimage(fid)
    run('config.m');
    
    % Read the components
    compY = fread(fid, [WIDTH HEIGHT], 'uint8');
    compY = compY';
    compU = fread(fid, [WIDTH/2 HEIGHT/2], 'uint8');
    compV = fread(fid, [WIDTH/2 HEIGHT/2], 'uint8');
end
