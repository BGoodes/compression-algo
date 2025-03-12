% Parameters
INPUT_FILE= "./media/news.qcif";
OUTPUT_FILE = "test.mat";

WIDTH = 176;
HEIGHT = 144;

N = 32;
Q_LVL = 16;

% Constants
NB_FRAME = dir(INPUT_FILE).bytes/(WIDTH*HEIGHT + WIDTH*HEIGHT/2);