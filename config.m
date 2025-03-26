% Parameters
INPUT_FILE= "./media/originals//news.qcif";
COMPRESSED_FILE = "./media/generated/test.meh";
DECOMPRESSED_FILE = "./media/generated/test.qcif";

WIDTH = 176;
HEIGHT = 144;

% DCT
BLOCK_SIZE = 8;

% Constants
NB_FRAME = 1; %dir(INPUT_FILE).bytes/(WIDTH*HEIGHT + WIDTH*HEIGHT/2);

DCT_WIDTH = BLOCK_SIZE^2;
DCT_HEIGHT_Y = WIDTH * HEIGHT / BLOCK_SIZE^2;
DCT_HEIGHT_UV = (WIDTH / 2) * (HEIGHT / 2) / BLOCK_SIZE^2;