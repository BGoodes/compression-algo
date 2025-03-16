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

function [compY,compU,compV]=yuv_readimage(fid, type)
    arguments
        fid
        type {mustBeMember(type, {'uint8', 'uint16'})} = 'uint8'
    end

    % Format
    width = 176;
    height = 144;
    
    % Read the components
    compY = fread(fid,[width height], type);
    compY = compY';
    compU = fread(fid, [width/2 height/2], type);
    compV = fread(fid, [width/2 height/2], type);
end
